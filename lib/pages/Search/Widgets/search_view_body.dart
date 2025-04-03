import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/Search/Widgets/custom_search_field.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  final List<List<String>> categories = const [
    ["assets/Ellipse 1.png", "Hoodies"],
    ["assets/Ellipse 2.png", "Shorts"],
    ["assets/Ellipse 3.png", "Shoes"],
    ["assets/Ellipse 4.png", "Bags"],
    ["assets/Ellipse 5.png", "Accessories"],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchField(),
        Text("Shop by Categories"),
        SizedBox(
          width: kPageViewWidth,
          height: 352,
          child: ListView.builder(
            itemBuilder: (context, i) {
              return OptionListTile(
                leading: Image.asset(categories[i][0]),
                title: categories[i][1],
              );
            },
            itemCount: categories.length,
            scrollDirection: Axis.vertical,
          ),
        ),
      ],
    );
  }
}
