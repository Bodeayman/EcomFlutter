import 'package:ecomflutter/Features/OnBoardingPage/Widgets/login_material_button.dart';
import 'package:ecomflutter/Features/ProductsPage/Data/Models/item.dart';
import 'package:ecomflutter/Features/ProductsPage/Presentation/Manager/main_products_cubit.dart';
import 'package:ecomflutter/Features/SearchPage/Widgets/shop_by_categories_view.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/utils/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

class SearchProductsGrid extends StatelessWidget {
  const SearchProductsGrid({super.key, required this.searchText});
  final String searchText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainProductsCubit, MainProductsState>(
      builder: (context, state) {
        if (state is MainProductsLoading) {
          return Center(child: Center(child: CircularProgressIndicator()));
        } else if (state is MainProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is MainProductsSuccess) {
          final List<Item> filtereddata =
              state.data.where((item) {
                final itemName = item.name.toLowerCase();
                final itemCategory = item.cat.toLowerCase();
                final searchLower = searchText.toLowerCase();
                return itemName.contains(searchLower) ||
                    itemCategory.contains(searchLower);
              }).toList();
          if (filtereddata.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Column(
                    children: [
                      Image.asset("assets/noSearch.png"),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Sorry, we couldn't find any matching result for your Search.",
                            style: TextStyle(
                              fontSize: kNoTextSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 52,
                        width: 195,
                        child: CustomeElevatedButton(
                          buttonColor: appbarSec,
                          callbackFunction: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => ShopByCategoriesView(),
                              ),
                            );
                          },
                          hintText: "Explore Categories",
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.55,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: filtereddata.length,
                itemBuilder: (BuildContext context, int index) {
                  final Item item = filtereddata[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: ProductCard(item: item),
                  );
                },
              ),
            ),
          );
        } else {
          return Center(child: Text("Try restart the program"));
        }
      },
    );
  }
}
