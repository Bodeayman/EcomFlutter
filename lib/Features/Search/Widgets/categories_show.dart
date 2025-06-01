import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';

class CategoriesShow extends StatelessWidget {
  const CategoriesShow({super.key});
  final List<List<String>> categories = const [
    ["assets/Ellipse 1.png", "Hoodies"],
    ["assets/Ellipse 2.png", "Shorts"],
    ["assets/Ellipse 3.png", "Shoes"],
    ["assets/Ellipse 4.png", "Bags"],
    ["assets/Ellipse 5.png", "Accessories"],
    ["assets/Ellipse 5.png", "Unknown"],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: double.infinity, child: Text("Shop by Categories")),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 352,
          child: ListView.builder(
            itemBuilder: (context, i) {
              return OptionListTile(
                leading:
                    (categories[i][1] != "Unknown")
                        ? Image.asset(categories[i][0])
                        : Icon(Icons.device_unknown),
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
