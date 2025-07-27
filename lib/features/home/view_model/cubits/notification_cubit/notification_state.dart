part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class GetNotificationLoading extends NotificationState {}

final class GetNotificationSuccess extends NotificationState {}

final class GetNotificationError extends NotificationState {}
