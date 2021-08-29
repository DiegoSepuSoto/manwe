part of 'service_screen_cubit.dart';

abstract class ServiceScreenState extends Equatable {
  const ServiceScreenState();

  @override
  List<Object> get props => [];
}

class ServiceScreenInitial extends ServiceScreenState {}

class ServiceScreenLoading extends ServiceScreenState {}

class ServiceScreenSuccessLoad extends ServiceScreenState {
  final ServiceScreen serviceScreen;

  ServiceScreenSuccessLoad({required this.serviceScreen});

  @override
  List<Object> get props => [serviceScreen];
}

class ServiceScreenFailedLoad extends ServiceScreenState {
  final String errorMessage;

  ServiceScreenFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
