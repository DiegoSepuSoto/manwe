part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccessLoad extends HomeState {
  final HomePage homePage;

  HomeSuccessLoad({required this.homePage});

  @override
  List<Object> get props => [homePage];
}

class HomeFailedLoad extends HomeState {
  final String errorMessage;

  HomeFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
