import 'package:ecomflutter/Features/DetailsPage/details.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/item.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/Manager/main_products_cubit.dart';
import 'package:ecomflutter/utils/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

class CategoryProductGrid extends StatelessWidget {
  const CategoryProductGrid({super.key, required this.categoryName});
  final String categoryName;

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
              (categoryName == "Top Selling" || categoryName == "New in")
                  ? state.data
                  : state.data
                      .where((item) => item.cat == categoryName)
                      .toList();
          if (filtereddata.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text("No Products of that Category is found"),
                  ),
                ),
              ],
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
