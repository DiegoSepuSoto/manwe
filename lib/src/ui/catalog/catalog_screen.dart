import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/catalog_repository.dart';
import 'package:manwe/src/domain/blocs/catalog/catalog_screen_cubit.dart';
import 'package:manwe/src/ui/catalog/components/category_list.dart';
import 'package:manwe/src/ui/catalog/components/search_button.dart';
import 'package:manwe/src/ui/catalog/components/service_cards.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen();

  @override
  Widget build(BuildContext context) {
    final catalogRepository = new CatalogRepository();

    return BlocProvider(
      create: (context) =>
      CatalogScreenCubit(catalogRepository: catalogRepository)
        ..catalogScreenStarted(),
      child: BlocBuilder<CatalogScreenCubit, CatalogScreenState>(
        builder: (context, state) {
          if (state is CatalogScreenLoading) {
            return Scaffold(
              body: LoadingCube(),
            );
          } else if (state is CatalogScreenSuccessLoad) {
            final catalogScreen = state.catalogScreen;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SearchButton(),
                  ServiceCards(
                    services: catalogScreen.services
                  ),
                  CategoryList(
                    categories: catalogScreen.categories,
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              body: ErrorScreen(),
            );
          }
        },
      ),
    );
  }
}
