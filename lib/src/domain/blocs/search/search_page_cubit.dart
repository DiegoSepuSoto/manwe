import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/search_page.dart';
import 'package:manwe/src/domain/repositories/abstract_search_page_repository.dart';

part 'search_page_state.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  AbstractSearchPageRepository searchPageRepository;

  SearchPageCubit({required this.searchPageRepository}) : super(SearchPageInitial());

  void searchPageStarted() async {
    emit(SearchPageLoading());
    try {
      final searchPage = await searchPageRepository.getSearchPage();
      emit(SearchPageSuccessLoad(searchPage: searchPage));
    } catch(err) {
      emit(SearchPageFailedLoad(errorMessage: err.toString()));
    }
  }
}
