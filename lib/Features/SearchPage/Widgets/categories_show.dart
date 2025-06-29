import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesShow extends StatelessWidget {
  const CategoriesShow({super.key});
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            "Shop by Categories",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return InkWell(
                child: OptionListTile(
                  leading: Image.asset(categories[i][0]),
                  title: categories[i][1],
                ),
                onTap: () {
                  String category = Uri.encodeComponent(categories[i][1]);
                  context.push('/categories/$category');
                },
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
