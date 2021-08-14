part of 'service_cubit.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceSuccessLoad extends ServiceState {
  final ServicePage servicePage;

  ServiceSuccessLoad({required this.servicePage});

  @override
  List<Object> get props => [servicePage];
}

class ServiceFailedLoad extends ServiceState {
  final String errorMessage;

  ServiceFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
