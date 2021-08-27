import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/search_page_repository.dart';
import 'package:manwe/src/domain/blocs/search/search_page_cubit.dart';
import 'package:manwe/src/domain/models/search_page.dart';
import 'package:manwe/src/ui/search/components/category_list.dart';
import 'package:manwe/src/ui/search/components/search_text_field.dart';
import 'package:manwe/src/ui/search/components/service_cards.dart';
import 'package:manwe/src/ui/shared/components/error_page.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen();

  @override
  Widget build(BuildContext context) {
    final searchPageRepository = new SearchPageRepository();

    return BlocProvider(
      create: (context) =>
      SearchPageCubit(searchPageRepository: searchPageRepository)
        ..searchPageStarted(),
      child: BlocBuilder<SearchPageCubit, SearchPageState>(
        builder: (context, state) {
          if (state is SearchPageLoading) {
            return LoadingCube();
          } else if (state is SearchPageSuccessLoad) {
            final searchPage = state.searchPage;

            return SingleChildScrollView(
              child: Column(
                children: [
                  ServiceCards(
                    services: searchPage.services
                  ),
                  CategoryList(
                    categories: searchPage.categories,
                  )
                ],
              ),
            );
          } else {
            return ErrorPage();
          }
        },
      ),
    );
  }
}
