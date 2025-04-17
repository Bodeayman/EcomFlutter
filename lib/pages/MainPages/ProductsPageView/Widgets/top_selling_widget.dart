import 'package:ecomflutter/cubit/main_products_cubit.dart';
import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/pages/Details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TopSellingWidget extends StatelessWidget {
  const TopSellingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainProductsCubit, MainProductsState>(
      builder: (context, state) {
        if (state is MainProductsLoading) {
          return SizedBox(
            height: 282,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is MainProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is MainProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 282,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = state.data[index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                    child: SizedBox(
                      width: 159,
                      child: GestureDetector(
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
                                  // Product Image with Hero Animation
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
