import 'package:ecomflutter/Features/CategoriesPage/Presentation/Views/Widgets/category_product_grid.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
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
            SizedBox(height: 20),
            Text(
              categoryName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CategoryProductGrid(categoryName: categoryName),
          ],
        ),
      ),
    );
  }
}
