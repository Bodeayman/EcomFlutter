import 'package:ecomflutter/Features/DetailsPage/details.dart';
import 'package:ecomflutter/Features/ProductsPage/Data/Models/item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 159,
      child: GestureDetector(
        onTap: () {
          try {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Details(item: item)),
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
                blurStyle: BlurStyle.solid,
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 0,
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
                      child: Image.network(
                        item.url,
                        fit: BoxFit.contain,
                        height: 10,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                            child: Container(color: Colors.grey[300]),
                          );
                        },
                        errorBuilder:
                            (context, error, stackTrace) => const Center(
                              child: Icon(Icons.error, color: Colors.red),
                            ),
                      ),
                    ),
                  ),

                  // Product Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),

                  // Add to Cart Button
                ],
              ),
              Positioned(
                left: 120,
                bottom: 230,
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
    );
  }
}
