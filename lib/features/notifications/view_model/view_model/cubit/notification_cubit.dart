import 'dart:async';

import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final SupabaseClient _supabase = Supabase.instance.client;
  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;

  StreamSubscription<AuthState>? _authStateSubscription;
  StreamSubscription<String>? _tokenRefreshSubscription;
  StreamSubscription<RemoteMessage>? _foregroundMessageSubscription;

  /// Initialize notification handling
  Future<void> initializeNotifications() async {
    try {
      emit(NotificationLoading());

      await _loadNotificationPreference();
      // Listen to auth state changes
      // _supabase.auth.onAuthStateChange.listen((event) async {
      //   if (event.event == AuthChangeEvent.signedIn) {
      //     await _handleUserSignedIn();
      //   }
      // });

      if (_notificationsEnabled) {
        // Listen to token refresh
        // _firebaseMessaging.onTokenRefresh.listen((fcmToken) async {
        //   await _updateFcmToken(fcmToken);
        // });
        await _initializeListeners();
        // Listen to foreground messages
        // FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

        // If user is already signed in, initialize immediately
        if (_supabase.auth.currentUser != null) {
          await _handleUserSignedIn();
        }
      } else {
        emit(NotificationDisabled());
      }
    } catch (e) {
      emit(NotificationError('Failed to initialize notifications: $e'));
    }
  }

  Future<void> _initializeListeners() async {
    // Listen to auth state changes
    _authStateSubscription = _supabase.auth.onAuthStateChange.listen((
      event,
    ) async {
      if (event.event == AuthChangeEvent.signedIn && _notificationsEnabled) {
        await _handleUserSignedIn();
      }
    });

    // Listen to token refresh
    _tokenRefreshSubscription = _firebaseMessaging.onTokenRefresh.listen((
      fcmToken,
    ) async {
      if (_notificationsEnabled) {
        await _updateFcmToken(fcmToken);
      }
    });

    // Listen to foreground messages
    _foregroundMessageSubscription = FirebaseMessaging.onMessage.listen(
      _handleForegroundMessage,
    );
  }

  bool isNotificationEnabled() {
    return _notificationsEnabled;
  }

  Future<void> _loadNotificationPreference() async {
    try {
      final sharedPreference = await SharedPreferences.getInstance();
      _notificationsEnabled =
          sharedPreference.getBool('notifications_enabled') ?? true;

      if (_notificationsEnabled) {
        emit(NotificationEnabled());
      } else {
        emit(NotificationDisabled());
      }
    } catch (e) {
      // Default to enabled if there's an error
      _notificationsEnabled = true;
    }
  }

  Future<void> toggleNotifications() async {
    if (_notificationsEnabled) {
      await disableNotifications();
    } else {
      await enableNotifications();
    }
  }

  Future<void> enableNotifications() async {
    try {
      emit(NotificationLoading());

      // Update local state
      _notificationsEnabled = true;
      await _saveNotificationPreference(true);

      // Request permission if not already granted
      final settings = await _firebaseMessaging.requestPermission();

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        // Get and update FCM token
        final fcmToken = await _firebaseMessaging.getToken();
        if (fcmToken != null) {
          await _updateFcmToken(fcmToken);
          // await _updateNotificationStatusInDatabase(true);
        }

        // Re-initialize listeners
        await _initializeListeners();

        emit(NotificationEnabled());
      } else {
        _notificationsEnabled = false;
        await _saveNotificationPreference(false);
        emit(NotificationError('Notification permission denied'));
      }
    } catch (e) {
      _notificationsEnabled = false;
      await _saveNotificationPreference(false);
      emit(NotificationError('Failed to enable notifications: $e'));
    }
  }

  /// Turn OFF notifications
  Future<void> disableNotifications() async {
    try {
      emit(NotificationLoading());

      // Update local state
      _notificationsEnabled = false;
      await _saveNotificationPreference(false);

      // Remove FCM token from database (but keep it locally for re-enabling)
      await _cancelAllListener();

      // Optionally delete FCM token completely (more secure)
      // await _firebaseMessaging.deleteToken();

      emit(NotificationDisabled());
    } catch (e) {
      emit(NotificationError('Failed to disable notifications: $e'));
    }
  }

  Future<void> _saveNotificationPreference(bool enabled) async {
    try {
      final sharedPreference = await SharedPreferences.getInstance();
      await sharedPreference.setBool('notifications_enabled', enabled);
    } catch (e) {
      emit(NotificationError('Failed to save notification preference: $e'));
    }
  }

  /// Handle user sign in
  Future<void> _handleUserSignedIn() async {
    try {
      // Request permission
      await requestPermission();

      // Get APNS token for iOS
      await _firebaseMessaging.getAPNSToken();

      // Get FCM token
      final fcmToken = await _firebaseMessaging.getToken();
      if (fcmToken != null) {
        await _updateFcmToken(fcmToken);
      }
    } catch (e) {
      emit(NotificationError('Failed to handle user sign in: $e'));
    }
  }

  /// Request notification permission
  Future<void> requestPermission() async {
    try {
      final settings = await _firebaseMessaging.requestPermission();

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        emit(NotificationPermissionRequested());
      } else {
        emit(NotificationError('Notification permission denied'));
      }
    } catch (e) {
      emit(NotificationError('Failed to request permission: $e'));
    }
  }

  /// Update FCM token in Supabase
  Future<void> _updateFcmToken(String fcmToken) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId != null) {
        await _supabase.from('users').upsert({
          'user_id': userId,
          'fcm_token': fcmToken,
        });

        emit(NotificationTokenUpdated(fcmToken));
      }
    } catch (e) {
      emit(NotificationError('Failed to update FCM token: $e'));
    }
  }

  /// Handle foreground messages
  void _handleForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      emit(
        NotificationReceived(
          title: notification.title ?? 'No Title',
          body: notification.body ?? 'No Body',
          timestamp: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _cancelAllListener() async {
    await _authStateSubscription?.cancel();
    await _tokenRefreshSubscription?.cancel();
    await _foregroundMessageSubscription?.cancel();

    _authStateSubscription = null;
    _tokenRefreshSubscription = null;
    _foregroundMessageSubscription = null;
  }

  /// Get current FCM token
  Future<String?> getCurrentToken() async {
    try {
      return await _firebaseMessaging.getToken();
    } catch (e) {
      emit(NotificationError('Failed to get current token: $e'));
      return null;
    }
  }

  void clearNotification() {
    emit(NotificationInitial());
  }
}
