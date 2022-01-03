import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/notifications_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_notification_repository.dart';

part 'notification_screen_state.dart';

class NotificationScreenCubit extends Cubit<NotificationScreenState> {
  AbstractNotificationRepository notificationRepository;

  NotificationScreenCubit({required this.notificationRepository}) : super(NotificationScreenInitial());

  void notificationScreenStarted() async {
    emit(NotificationScreenLoading());
    try {
      final notificationsScreen = await notificationRepository.getNotificationsScreen();
      emit(NotificationScreenSuccessLoad(notificationsScreen: notificationsScreen));
    } catch(err) {
      emit(NotificationScreenFailedLoad(errorMessage: err.toString()));
    }
  }
}
