import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/home_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_home_repository.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  AbstractHomeRepository homeRepository;

  HomeScreenCubit({required this.homeRepository}) : super(HomeInitial());

  void homeScreenStarted() async {
    emit(HomeLoading());
    try {
      final homeScreen = await homeRepository.getHomeScreen();
      emit(HomeSuccessLoad(homeScreen: homeScreen));
    } catch(err) {
      emit(HomeFailedLoad(errorMessage: err.toString()));
    }
  }
}
