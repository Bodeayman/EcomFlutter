import 'package:ecomflutter/Features/SearchPage/Widgets/custom_search_field.dart';
import 'package:ecomflutter/Features/SearchPage/Widgets/search_products_grid.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchFoundResultsView extends StatelessWidget {
  const SearchFoundResultsView({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  RawMaterialButton(
                    onPressed: () => context.pop(),
                    constraints: BoxConstraints.tightFor(width: 50, height: 50),
                    shape: CircleBorder(),
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
                  Expanded(
                    child: IgnorePointer(
                      child: CustomSearchField(
                        parentContext: context,
                        controller: searchController,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SearchProductsGrid(searchText: searchController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
