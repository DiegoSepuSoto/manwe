part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccessLoad extends PostState {
  final PostPage postPage;

  PostSuccessLoad({required this.postPage});

  @override
  List<Object> get props => [postPage];
}

class PostFailedLoad extends PostState {
  final String errorMessage;

  PostFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
