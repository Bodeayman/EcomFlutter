import 'package:ecomflutter/Features/DetailsPage/details.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/item.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/Manager/main_products_cubit.dart';
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
              state.data.where((item) => item.cat == categoryName).toList();
          if (filtereddata.isEmpty) {
            return Center(
              child: Center(
                child: Text("No Products of that Category is found"),
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
                    child: SizedBox(
                      width: 161,
                      height: 281,
                      child:
                      //          if(item.cat == categoryName){
                      // }
                      GestureDetector(
                        onTap: () {
                          try {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Details(item: item),
                              ),
                            );
                          } catch (err) {
                            debugPrint(err.toString());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 220,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                      child: Hero(
                                        tag: "product_${item.id}",
                                        child: Image.network(
                                          item.url,
                                          fit: BoxFit.contain,
                                          height: 10,
                                          width: double.infinity,
                                          loadingBuilder: (
                                            context,
                                            child,
                                            loadingProgress,
                                          ) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.white,
                                              child: Container(
                                                color: Colors.grey[300],
                                              ),
                                            );
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const Center(
                                                    child: Icon(
                                                      Icons.error,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Product Details
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),
                                      Text(
                                        item.name,
                                        style: const TextStyle(fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "${item.price} \$",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Add to Cart Button
                                ],
                              ),
                              Positioned(
                                left: 120,
                                bottom: 245,
                                child: IconButton(
                                  icon: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset("assets/heart.png"),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
