part of 'search_page_cubit.dart';

abstract class SearchPageState extends Equatable {
  const SearchPageState();

  @override
  List<Object> get props => [];
}

class SearchPageInitial extends SearchPageState {}

class SearchPageLoading extends SearchPageState {}

class SearchPageSuccessLoad extends SearchPageState {
  final SearchPage searchPage;

  SearchPageSuccessLoad({required this.searchPage});

  @override
  List<Object> get props => [searchPage];
}

class SearchPageFailedLoad extends SearchPageState {
  final String errorMessage;

  SearchPageFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
