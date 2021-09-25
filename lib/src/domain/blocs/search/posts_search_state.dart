part of 'posts_search_cubit.dart';

@immutable
abstract class PostsSearchState extends Equatable {
  const PostsSearchState();

  @override
  List<Object> get props => [];
}

class PostsSearchInitial extends PostsSearchState {}

class PostsSearchLoading extends PostsSearchState {}

class PostsSearchSuccessLoad extends PostsSearchState {
  final PostsSearchResult postsSearchResult;

  PostsSearchSuccessLoad({required this.postsSearchResult});

  @override
  List<Object> get props => [postsSearchResult];
}

class PostsSearchFailedLoad extends PostsSearchState {
  final String errorMessage;

  PostsSearchFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}