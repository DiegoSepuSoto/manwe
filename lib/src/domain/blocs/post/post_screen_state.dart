part of 'post_screen_cubit.dart';

abstract class PostScreenState extends Equatable {
  const PostScreenState();

  @override
  List<Object> get props => [];
}

class PostScreenInitial extends PostScreenState {}

class PostScreenLoading extends PostScreenState {}

class PostScreenSuccessLoad extends PostScreenState {
  final PostScreen postScreen;

  PostScreenSuccessLoad({required this.postScreen});

  @override
  List<Object> get props => [postScreen];
}

class PostScreenFailedLoad extends PostScreenState {
  final String errorMessage;

  PostScreenFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
