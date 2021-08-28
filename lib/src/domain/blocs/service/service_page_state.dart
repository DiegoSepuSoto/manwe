part of 'service_page_cubit.dart';

abstract class ServicePageState extends Equatable {
  const ServicePageState();

  @override
  List<Object> get props => [];
}

class ServicePageInitial extends ServicePageState {}

class ServicePageLoading extends ServicePageState {}

class ServicePageSuccessLoad extends ServicePageState {
  final ServicePage servicePage;

  ServicePageSuccessLoad({required this.servicePage});

  @override
  List<Object> get props => [servicePage];
}

class ServicePageFailedLoad extends ServicePageState {
  final String errorMessage;

  ServicePageFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
