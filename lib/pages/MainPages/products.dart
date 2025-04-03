import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/pages/Details/details.dart';
import 'package:ecomflutter/pages/MainPages/Widgets/categories_widget.dart';
import 'package:ecomflutter/pages/Search/Widgets/custom_search_field.dart';
import 'package:ecomflutter/pages/MainPages/Widgets/top_selling_widget.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset("assets/img/stripe.png"),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    decoration: BoxDecoration(color: kTextForm),
                    child: Text("Men"),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    decoration: BoxDecoration(color: appbarSec),
                    height: 40,
                    width: 40,
                    child: Image.asset("assets/bag2.png"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            InkWell(
              onTap: () {
                context.push('/search');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(color: kTextForm),
                    child: SizedBox(
                      width: 100,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/searchnormal1.png"),
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
              trailing: Text("See All"),
            ),
            CategoriesWidget(),
            ListTile(
              title: Text(
                "Top Selling",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text("See All"),
            ),
            TopSellingWidget(),
            ListTile(
              title: Text(
                "New in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text("See All"),
            ),
            TopSellingWidget(),
          ],
        ),
      ),
    );
  }
}
