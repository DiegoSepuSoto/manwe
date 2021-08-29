import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/post_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_post_repository.dart';

part 'post_screen_state.dart';

class PostScreenCubit extends Cubit<PostScreenState> {
  AbstractPostRepository postScreenRepository;

  PostScreenCubit({required this.postScreenRepository}) : super(PostScreenInitial());

  void postScreenStarted(String id) async {
    emit(PostScreenLoading());
    try {
      final postScreen = await postScreenRepository.getPostScreen(id);
      emit(PostScreenSuccessLoad(postScreen: postScreen));
    } catch(err) {
      emit(PostScreenFailedLoad(errorMessage: err.toString()));
    }
  }
}
