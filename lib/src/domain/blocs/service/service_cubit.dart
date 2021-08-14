import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/service_page.dart';
import 'package:manwe/src/domain/repositories/abstract_service_page_repository.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  AbstractServicePageRepository servicePageRepository;

  ServiceCubit({required this.servicePageRepository}) : super(ServiceInitial());

  void servicePageStarted(String id) async {
    emit(ServiceLoading());
    try {
      final servicePage = await servicePageRepository.getServicePage(id);
      emit(ServiceSuccessLoad(servicePage: servicePage));
    } catch(err) {
      emit(ServiceFailedLoad(errorMessage: err.toString()));
    }
  }
}
