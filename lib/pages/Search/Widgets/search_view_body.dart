import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/MainPages/ProductsPageView/Widgets/categories_widget.dart';
import 'package:ecomflutter/pages/Search/Widgets/categories_show.dart';
import 'package:ecomflutter/pages/Search/Widgets/custom_search_field.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CustomSearchField(bigContext: context),
            const SizedBox(height: 10),
            CategoriesShow(),
          ],
        ),
      ),
    );
  }
}
