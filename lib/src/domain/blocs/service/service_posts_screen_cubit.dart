import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/service_posts_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_service_repository.dart';

part 'service_posts_screen_state.dart';

class ServicePostsScreenCubit extends Cubit<ServicePostsScreenState> {
  AbstractServiceRepository serviceRepository;

  ServicePostsScreenCubit({required this.serviceRepository})
      : super(ServicePostsScreenInitial());

  void servicePostsScreenStarted(String id) async {
    emit(ServicePostsScreenLoading());
    try {
      final servicePostsScreen = await serviceRepository.getServicePostsScreen(id);
      emit(ServicePostsScreenSuccessLoad(servicePostsScreen: servicePostsScreen));
    } catch (err) {
      emit(ServicePostsScreenFailedLoad(errorMessage: err.toString()));
    }
  }
}
