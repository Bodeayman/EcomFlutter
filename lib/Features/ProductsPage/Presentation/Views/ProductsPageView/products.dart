import 'package:ecomflutter/Features/CategoriesPage/Presentation/Views/category_view.dart';
import 'package:ecomflutter/Features/ProductsPage/Presentation/Manager/main_products_cubit.dart';
import 'package:ecomflutter/Features/SearchPage/Widgets/custom_search_field.dart';
import 'package:ecomflutter/Features/SearchPage/search_view.dart';
import 'package:ecomflutter/Features/ProductsPage/Presentation/Views/ProductsPageView/Widgets/categories_widget.dart';
import 'package:ecomflutter/Features/ProductsPage/Presentation/Views/ProductsPageView/Widgets/custom_main_page_app_bar.dart';
import 'package:ecomflutter/Features/ProductsPage/Presentation/Views/ProductsPageView/Widgets/new_items_widget.dart';
import 'package:ecomflutter/Features/ProductsPage/Presentation/Views/ProductsPageView/Widgets/top_selling_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<MainProductsCubit>().loadItems(),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CustomMainPageAppBar(),
              const SizedBox(height: 40),

              CustomSearchField(parentContext: context),
              ListTile(
                title: Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: InkWell(
                  onTap:
                      () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SearchView()),
                        ),
                      },
                  child: Text("See All", style: TextStyle(fontSize: 16)),
                ),
              ),
              Center(child: CategoriesWidget()),
              ListTile(
                title: Text(
                  "Top Selling",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: InkWell(
                  onTap:
                      () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    CategoryView(categoryName: "Top Selling"),
                          ),
                        ),
                        debugPrint("Top Selling"),
                      },
                  child: Text("See All", style: TextStyle(fontSize: 16)),
                ),
              ),
              TopSellingWidget(),
              ListTile(
                title: Text(
                  "New in",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: InkWell(
                  child: Text("See All", style: TextStyle(fontSize: 16)),
                  onTap:
                      () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    CategoryView(categoryName: "New in"),
                          ),
                        ),
                        debugPrint("New in"),
                      },
                ),
              ),
              NewItemsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
