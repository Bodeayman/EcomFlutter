import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});
  final List<List<String>> categories = const [
    ["assets/Ellipse 1.png", "Hoodies"],
    ["assets/Ellipse 2.png", "Shorts"],
    ["assets/Ellipse 3.png", "Shoes"],
    ["assets/Ellipse 4.png", "Bags"],
    ["assets/Ellipse 5.png", "Accessories"],
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: kCatImageSize,
                  width: kCatImageSize,
                  child: Image.asset(categories[i][0]),
                ),
                Text(
                  categories[i][1],
                  style: TextStyle(fontSize: kNormalFontSize),
                ),
              ],
            ),
          );
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
