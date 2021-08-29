import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/service_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_service_repository.dart';

part 'service_screen_state.dart';

class ServiceCubit extends Cubit<ServiceScreenState> {
  AbstractServiceRepository serviceRepository;

  ServiceCubit({required this.serviceRepository})
      : super(ServiceScreenInitial());

  void serviceScreenStarted(String id) async {
    emit(ServiceScreenLoading());
    try {
      final serviceScreen = await serviceRepository.getServiceScreen(id);
      emit(ServiceScreenSuccessLoad(serviceScreen: serviceScreen));
    } catch (err) {
      emit(ServiceScreenFailedLoad(errorMessage: err.toString()));
    }
  }
}
