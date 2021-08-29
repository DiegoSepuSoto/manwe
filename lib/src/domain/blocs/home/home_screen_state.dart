part of 'home_screen_cubit.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeScreenState {}

class HomeLoading extends HomeScreenState {}

class HomeSuccessLoad extends HomeScreenState {
  final HomeScreen homeScreen;

  HomeSuccessLoad({required this.homeScreen});

  @override
  List<Object> get props => [homeScreen];
}

class HomeFailedLoad extends HomeScreenState {
  final String errorMessage;

  HomeFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
