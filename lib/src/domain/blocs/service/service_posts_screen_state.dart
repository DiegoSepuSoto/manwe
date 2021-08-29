part of 'service_posts_screen_cubit.dart';

abstract class ServicePostsScreenState extends Equatable {
  const ServicePostsScreenState();

  @override
  List<Object> get props => [];
}

class ServicePostsScreenInitial extends ServicePostsScreenState {}

class ServicePostsScreenLoading extends ServicePostsScreenState {}

class ServicePostsScreenSuccessLoad extends ServicePostsScreenState {
  final ServicePostsScreen servicePostsScreen;

  ServicePostsScreenSuccessLoad({required this.servicePostsScreen});

  @override
  List<Object> get props => [servicePostsScreen];
}

class ServicePostsScreenFailedLoad extends ServicePostsScreenState {
  final String errorMessage;

  ServicePostsScreenFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
