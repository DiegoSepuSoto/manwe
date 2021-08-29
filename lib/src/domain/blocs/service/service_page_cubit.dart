import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/service_page.dart';
import 'package:manwe/src/domain/repositories/abstract_service_repository.dart';

part 'service_page_state.dart';

class ServiceCubit extends Cubit<ServicePageState> {
  AbstractServiceRepository servicePageRepository;

  ServiceCubit({required this.servicePageRepository})
      : super(ServicePageInitial());

  void servicePageStarted(String id) async {
    emit(ServicePageLoading());
    try {
      final servicePage = await servicePageRepository.getServicePage(id);
      emit(ServicePageSuccessLoad(servicePage: servicePage));
    } catch (err) {
      emit(ServicePageFailedLoad(errorMessage: err.toString()));
    }
  }
}
