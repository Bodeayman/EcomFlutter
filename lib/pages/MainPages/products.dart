import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/pages/Details/details.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), // Added some padding around the grid
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 5, // Balanced layout
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = itemList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Details(item: item)),
              );
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image with Hero Animation
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Hero(
                        tag: "product_${item.id}",
                        child: Image.network(
                          item.url,
                          fit: BoxFit.contain,
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
                  ),

                  // Product Details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${item.price} \$",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add to Cart Button
                  Consumer<Cart>(
                    builder: (context, cart, child) {
                      bool isInCart = cart.isInCart(item);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            isInCart ? Icons.check : Icons.add_shopping_cart,
                          ),
                          label: Text(isInCart ? "Added" : "Add to Cart"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isInCart ? btnPink : appbarSec,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            cart.addElementToCart(item);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
