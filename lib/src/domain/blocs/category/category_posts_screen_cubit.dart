import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/category_posts_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_category_repository.dart';

part 'category_posts_screen_state.dart';

class CategoryPostsScreenCubit extends Cubit<CategoryPostsScreenState> {
  AbstractCategoryRepository categoryRepository;

  CategoryPostsScreenCubit({required this.categoryRepository})
      : super(CategoryPostsScreenInitial());

  void categoryPostsScreenStarted(String categoryID) async {
    emit(CategoryPostsScreenLoading());
    try {
      final categoryPosts =
          await categoryRepository.getCategoryPostsScreen(categoryID);

      emit(CategoryPostsScreenSuccessLoad(categoryPostsScreen: categoryPosts));
    } catch (e) {
      emit(CategoryPostsScreenFailedLoad(errorMessage: e.toString()));
    }
  }
}
