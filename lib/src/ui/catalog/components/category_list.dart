import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/catalog_screen.dart';
import 'package:manwe/src/ui/catalog/components/category_item.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.3,
      margin: EdgeInsets.only(
        top: kDefaultPadding,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(3, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CategoryItem(
            id: categories[index].id,
            title: categories[index].name,
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: categories.length,
      ),
    );
  }
}
