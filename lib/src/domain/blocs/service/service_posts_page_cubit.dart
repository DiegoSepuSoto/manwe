import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/service_posts_page.dart';
import 'package:manwe/src/domain/repositories/abstract_service_page_repository.dart';

part 'service_posts_page_state.dart';

class ServicePostsPageCubit extends Cubit<ServicePostsPageState> {
  AbstractServiceRepository serviceRepository;

  ServicePostsPageCubit({required this.serviceRepository})
      : super(ServicePostsPageInitial());

  void servicePostsPageStarted(String id) async {
    emit(ServicePostsPageLoading());
    try {
      final servicePostsPage = await serviceRepository.getServicePosts(id);
      emit(ServicePostsPageSuccessLoad(servicePostsPage: servicePostsPage));
    } catch (err) {
      emit(ServicePostsPageFailedLoad(errorMessage: err.toString()));
    }
  }
}
