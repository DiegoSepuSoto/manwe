import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/models/catalog_screen.dart';
import 'package:manwe/src/domain/repositories/abstract_catalog_repository.dart';

part 'catalog_screen_state.dart';

class CatalogScreenCubit extends Cubit<CatalogScreenState> {
  AbstractCatalogRepository catalogRepository;

  CatalogScreenCubit({required this.catalogRepository}) : super(CatalogScreenInitial());

  void catalogScreenStarted() async {
    emit(CatalogScreenLoading());
    try {
      final catalogScreen = await catalogRepository.getCatalogScreen();
      emit(CatalogScreenSuccessLoad(catalogScreen: catalogScreen));
    } catch(err) {
      emit(CatalogScreenFailedLoad(errorMessage: err.toString()));
    }
  }
}
