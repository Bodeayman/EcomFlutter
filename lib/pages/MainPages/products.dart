import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/pages/Details/details.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Every element in the axis
        childAspectRatio: 3 / 2, //
        crossAxisSpacing: 10, // spacing in the columns;
        mainAxisSpacing: 10, // spacing in the rows
      ),
      //This is a constant widget , which doesn't require changing
      itemCount:
          itemList.length, // This is the number of times the loop will happen
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          //is detecting the clicking
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(item: itemList[index]),
              ),
            );
            //For this item, we should go for another page
          },
          child: GridTile(
            footer: GridTileBar(
              //This is for the products, is will be legit
              backgroundColor: const Color.fromARGB(66, 73, 127, 110),

              trailing: Consumer<Cart>(
                builder: (context, value, child) {
                  return IconButton(
                    icon: const Icon(Icons.plus_one),
                    onPressed: () {
                      value.add(itemList[index]);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(99, 79, 62, 62),
                      ),
                    ),
                  );
                },
              ),

              title: const Text(""),
              // To make the button on the end , or the right meaning , the trailing is in the end , then you should add some Title in the middle
              leading: Text("${itemList[index].price}"),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -3,
                  bottom: -9,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(55),
                    child: Image.network(itemList[index].url, scale: 1),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
