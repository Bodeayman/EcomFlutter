import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/MainPages/ProductsPageView/Widgets/categories_widget.dart';
import 'package:ecomflutter/pages/MainPages/ProductsPageView/Widgets/custom_main_page_app_bar.dart';
import 'package:ecomflutter/pages/MainPages/ProductsPageView/Widgets/top_selling_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CustomMainPageAppBar(),
            const SizedBox(height: 40),

            InkWell(
              onTap: () {
                context.push('/search');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(color: kTextForm),
                    child: SizedBox(
                      width: 150,

                      child: Row(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Image.asset("assets/searchnormal1.png"),
                              const SizedBox(width: 20),

                              Text("Search"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text("See All", style: TextStyle(fontSize: 16)),
            ),
            CategoriesWidget(),
            ListTile(
              title: Text(
                "Top Selling",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text("See All", style: TextStyle(fontSize: 16)),
            ),
            TopSellingWidget(),
            ListTile(
              title: Text(
                "New in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text("See All"),
            ),
          ],
        ),
      ),
    );
  }
}
