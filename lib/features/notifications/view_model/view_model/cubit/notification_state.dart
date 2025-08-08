// import 'package:equatable/equatable.dart';

abstract class NotificationState {
  const NotificationState();

  // @override
  // List<Object?> get props => [];
}

final class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationPermissionRequested extends NotificationState {}

class NotificationTokenUpdated extends NotificationState {
  final String token;

  const NotificationTokenUpdated(this.token);

  // @override
  // List<Object?> get props => [token];
}

class NotificationReceived extends NotificationState {
  final String title;
  final String body;
  final DateTime timestamp;

  const NotificationReceived({
    required this.title,
    required this.body,
    required this.timestamp,
  });

  // @override
  // List<Object?> get props => [title, body, timestamp];
}

class NotificationError extends NotificationState {
  final String message;

  const NotificationError(this.message);

  // @override
  // List<Object?> get props => [message];
}

class NotificationEnabled extends NotificationState {}

class NotificationDisabled extends NotificationState {}
