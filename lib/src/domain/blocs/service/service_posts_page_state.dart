part of 'service_posts_page_cubit.dart';

abstract class ServicePostsPageState extends Equatable {
  const ServicePostsPageState();

  @override
  List<Object> get props => [];
}

class ServicePostsPageInitial extends ServicePostsPageState {}

class ServicePostsPageLoading extends ServicePostsPageState {}

class ServicePostsPageSuccessLoad extends ServicePostsPageState {
  final ServicePostsPage servicePostsPage;

  ServicePostsPageSuccessLoad({required this.servicePostsPage});

  @override
  List<Object> get props => [servicePostsPage];
}

class ServicePostsPageFailedLoad extends ServicePostsPageState {
  final String errorMessage;

  ServicePostsPageFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
