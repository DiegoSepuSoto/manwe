part of 'category_posts_screen_cubit.dart';

abstract class CategoryPostsScreenState extends Equatable {
  const CategoryPostsScreenState();

  @override
  List<Object> get props => [];
}

class CategoryPostsScreenInitial extends CategoryPostsScreenState {}

class CategoryPostsScreenLoading extends CategoryPostsScreenState {}

class CategoryPostsScreenSuccessLoad extends CategoryPostsScreenState {
  final CategoryPostsScreen categoryPostsScreen;

  const CategoryPostsScreenSuccessLoad({required this.categoryPostsScreen});

  @override
  List<Object> get props => [categoryPostsScreen];
}

class CategoryPostsScreenFailedLoad extends CategoryPostsScreenState {
  final String errorMessage;

  const CategoryPostsScreenFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
