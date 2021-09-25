part of 'catalog_screen_cubit.dart';

abstract class CatalogScreenState extends Equatable {
  const CatalogScreenState();

  @override
  List<Object> get props => [];
}

class CatalogScreenInitial extends CatalogScreenState {}

class CatalogScreenLoading extends CatalogScreenState {}

class CatalogScreenSuccessLoad extends CatalogScreenState {
  final CatalogScreen catalogScreen;

  CatalogScreenSuccessLoad({required this.catalogScreen});

  @override
  List<Object> get props => [catalogScreen];
}

class CatalogScreenFailedLoad extends CatalogScreenState {
  final String errorMessage;

  CatalogScreenFailedLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
