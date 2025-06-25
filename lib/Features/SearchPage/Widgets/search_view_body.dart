import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/Features/MainPages/ProductsPageView/Widgets/categories_widget.dart';
import 'package:ecomflutter/Features/SearchPage/Widgets/categories_show.dart';
import 'package:ecomflutter/Features/SearchPage/Widgets/custom_search_field.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            RawMaterialButton(
              onPressed: () => context.pop(),
              constraints: BoxConstraints.tightFor(width: 50, height: 50),
              shape: const CircleBorder(),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: kTextForm,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset("assets/arrowleft2.png"),
              ),
            ),
            const SizedBox(height: 10),
            CategoriesShow(),
          ],
        ),
      ),
    );
  }
}
