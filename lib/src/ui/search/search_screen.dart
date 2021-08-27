import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/search_page.dart';
import 'package:manwe/src/ui/search/components/category_list.dart';
import 'package:manwe/src/ui/search/components/search_text_field.dart';
import 'package:manwe/src/ui/search/components/service_cards.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SearchTextField(),
          ServiceCards(
            services: [
              Service(
                id: "312",
                name: "Plan de Apoyo Estudiantil",
                logoUrl:
                    "http://161.35.61.222:1337/uploads/logo_PAE_1ab5b44374.png",
              ),
              Service(
                id: "312",
                name: "Plan de Apoyo Estudiantil",
                logoUrl:
                    "http://161.35.61.222:1337/uploads/logo_PAE_1ab5b44374.png",
              ),
              Service(
                id: "312",
                name: "Plan de Apoyo Estudiantil",
                logoUrl:
                    "http://161.35.61.222:1337/uploads/logo_PAE_1ab5b44374.png",
              ),
            ],
          ),
          CategoryList(
            categories: [
              Category(
                id: "321",
                name: "Autodescubrimiento",
              ),
              Category(
                id: "321",
                name: "Autodescubrimiento",
              ),
              Category(
                id: "321",
                name: "Autodescubrimiento",
              ),
              Category(
                id: "321",
                name: "Autodescubrimiento",
              ),
              Category(
                id: "321",
                name: "Autodescubrimiento",
              ),
              Category(
                id: "321",
                name: "Autodescubrimiento",
              ),
              Category(
                id: "321",
                name: "Autodescubrimiento",
              ),
              Category(
                id: "321",
                name: "Autodescubrimiento",
              ),
            ],
          )
        ],
      ),
    );
  }
}
