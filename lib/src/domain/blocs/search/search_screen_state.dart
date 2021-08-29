part of 'search_screen_cubit.dart';

abstract class SearchScreenState extends Equatable {
  const SearchScreenState();

  @override
  List<Object> get props => [];
}

class SearchScreenInitial extends SearchScreenState {}

class SearchScreenLoading extends SearchScreenState {}

class SearchScreenSuccessLoad extends SearchScreenState {
  final SearchScreen searchScreen;

  SearchScreenSuccessLoad({required this.searchScreen});

  @override
  List<Object> get props => [searchScreen];
}

class SearchScreenFailedLoad extends SearchScreenState {
  final String errorMessage;

  SearchScreenFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
