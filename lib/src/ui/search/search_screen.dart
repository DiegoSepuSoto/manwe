import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/search_repository.dart';
import 'package:manwe/src/domain/blocs/search/search_screen_cubit.dart';
import 'package:manwe/src/ui/search/components/category_list.dart';
import 'package:manwe/src/ui/search/components/search_button.dart';
import 'package:manwe/src/ui/search/components/service_cards.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen();

  @override
  Widget build(BuildContext context) {
    final searchRepository = new SearchRepository();

    return BlocProvider(
      create: (context) =>
      SearchScreenCubit(searchRepository: searchRepository)
        ..searchScreenStarted(),
      child: BlocBuilder<SearchScreenCubit, SearchScreenState>(
        builder: (context, state) {
          if (state is SearchScreenLoading) {
            return Scaffold(
              body: LoadingCube(),
            );
          } else if (state is SearchScreenSuccessLoad) {
            final searchScreen = state.searchScreen;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SearchButton(),
                  ServiceCards(
                    services: searchScreen.services
                  ),
                  CategoryList(
                    categories: searchScreen.categories,
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
