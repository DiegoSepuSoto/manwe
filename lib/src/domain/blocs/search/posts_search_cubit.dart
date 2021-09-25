import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/posts_search_result.dart';
import 'package:manwe/src/domain/repositories/abstract_search_repository.dart';
import 'package:meta/meta.dart';

part 'posts_search_state.dart';

class PostsSearchCubit extends Cubit<PostsSearchState> {
  AbstractSearchRepository searchRepository;

  PostsSearchCubit({required this.searchRepository}) : super(PostsSearchInitial());

  void postsSearchStarted(String term) async {
    emit(PostsSearchLoading());
    try {
      final postsSearchResult = await searchRepository.getPostsSearchResult(term);
      emit(PostsSearchSuccessLoad(postsSearchResult: postsSearchResult));
    } catch (err) {
      emit(PostsSearchFailedLoad(errorMessage: err.toString()));
    }
  }
}
