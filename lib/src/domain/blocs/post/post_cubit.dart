import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/post_page.dart';
import 'package:manwe/src/domain/repositories/abstract_post_page_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  AbstractPostPageRepository postPageRepository;

  PostCubit({required this.postPageRepository}) : super(PostInitial());

  void postPageStarted(String id) async {
    emit(PostLoading());
    try {
      final postPage = await postPageRepository.getPostPage(id);
      emit(PostSuccessLoad(postPage: postPage));
    } catch(err) {
      emit(PostFailedLoad(errorMessage: err.toString()));
    }
  }
}
