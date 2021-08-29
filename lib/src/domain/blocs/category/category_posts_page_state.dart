part of 'category_posts_page_cubit.dart';

abstract class CategoryPostsPageState extends Equatable {
  const CategoryPostsPageState();

  @override
  List<Object> get props => [];
}

class CategoryPostsPageInitial extends CategoryPostsPageState {}

class CategoryPostsPageLoading extends CategoryPostsPageState {}

class CategoryPostsPageSuccessLoad extends CategoryPostsPageState {
  final CategoryPostsPage categoryPostsPage;

  const CategoryPostsPageSuccessLoad({required this.categoryPostsPage});

  @override
  List<Object> get props => [categoryPostsPage];
}

class CategoryPostsPageFailedLoad extends CategoryPostsPageState {
  final String errorMessage;

  const CategoryPostsPageFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
