part of 'notification_screen_cubit.dart';

abstract class NotificationScreenState extends Equatable {
  const NotificationScreenState();

  @override
  List<Object> get props => [];
}

class NotificationScreenInitial extends NotificationScreenState {}

class NotificationScreenLoading extends NotificationScreenState {}

class NotificationScreenSuccessLoad extends NotificationScreenState {
  final NotificationsScreen notificationsScreen;

  NotificationScreenSuccessLoad({required this.notificationsScreen});

  @override
  List<Object> get props => [notificationsScreen];
}

class NotificationScreenFailedLoad extends NotificationScreenState {
  final String errorMessage;

  NotificationScreenFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}