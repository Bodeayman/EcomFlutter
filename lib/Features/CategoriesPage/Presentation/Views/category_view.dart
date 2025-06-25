import 'package:ecomflutter/Features/CategoriesPage/Presentation/Views/Widgets/category_view_body.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CategoryViewBody(categoryName: categoryName));
  }
}
