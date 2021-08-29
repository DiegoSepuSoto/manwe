import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/category_posts_page.dart';
import 'package:manwe/src/domain/repositories/abstract_category_repository.dart';

part 'category_posts_page_state.dart';

class CategoryPostsPageCubit extends Cubit<CategoryPostsPageState> {
  AbstractCategoryRepository categoryRepository;

  CategoryPostsPageCubit({required this.categoryRepository})
      : super(CategoryPostsPageInitial());

  void categoryPostsPageStarted(String categoryID) async {
    emit(CategoryPostsPageLoading());
    try {
      final categoryPosts =
          await categoryRepository.getCategoryPostsPage(categoryID);

      emit(CategoryPostsPageSuccessLoad(categoryPostsPage: categoryPosts));
    } catch (e) {
      emit(CategoryPostsPageFailedLoad(errorMessage: e.toString()));
    }
  }
}
