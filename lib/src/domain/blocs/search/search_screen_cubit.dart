import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/search_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_search_repository.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  AbstractSearchRepository searchRepository;

  SearchScreenCubit({required this.searchRepository}) : super(SearchScreenInitial());

  void searchScreenStarted() async {
    emit(SearchScreenLoading());
    try {
      final searchScreen = await searchRepository.getSearchScreen();
      emit(SearchScreenSuccessLoad(searchScreen: searchScreen));
    } catch(err) {
      emit(SearchScreenFailedLoad(errorMessage: err.toString()));
    }
  }
}
