import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/home_page.dart';
import 'package:manwe/src/domain/repositories/abstract_home_page_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  AbstractHomePageRepository homePageRepository;

  HomeCubit({required this.homePageRepository}) : super(HomeInitial());

  void homePageStarted() async {
    emit(HomeLoading());
    try {
      final homePage = await homePageRepository.getHomePage();
      emit(HomeSuccessLoad(homePage: homePage));
    } catch(err) {
      emit(HomeFailedLoad(errorMessage: err.toString()));
    }
  }
}
