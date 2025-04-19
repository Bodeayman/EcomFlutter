import 'dart:convert';

import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/cubit/cart_cubit.dart';
import 'package:ecomflutter/model/rating.dart';
import 'package:ecomflutter/pages/Details/Widgets/details_view_functions.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:ecomflutter/provider/cart.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/model/item.dart';

class Details extends StatefulWidget {
  final Item item;
  const Details({super.key, required this.item});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Future<Rating> fetchRating() async {
    final response = await http.get(
      Uri.parse('http://localhost:5000/api/rating/${widget.item.id}'),
    );
    List<dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());
    if (response.statusCode == 200) {
      return Rating(
        data[0]["id"],
        data[0]["rating"],
        data[0]["comment"],
        data[0]["userId"],
        data[0]["productId"],
      );
    } else {
      throw Exception('Failed to load users');
    }
  }

  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => {context.pop()},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: kTextForm,
                  borderRadius: BorderRadius.circular(100),
                ),

                child: Image.asset("assets/arrowleft2.png"),
              ),
            ),
            SizedBox(
              height: 248,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.item.url,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(
                          Icons.error,
                          size: 50,
                          color: Colors.red,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  "${widget.item.price} \$",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: appbarSec,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            OptionListTile(
              tileBorder: kExtremeRaduis,

              title: "Size",
              trailing: SizedBox(
                width: 60,
                child: Row(
                  children: [
                    Text("S", style: TextStyle(fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: Image.asset("assets/arrowdown2.png"),
                      onPressed: () => showSizes(context),
                    ),
                  ],
                ),
              ),
            ),
            OptionListTile(
              tileBorder: kExtremeRaduis,

              title: "Color",
              trailing: SizedBox(
                width: 60,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kExtremeRaduis),
                      child: Container(
                        color: Colors.amber,
                        width: 10,
                        height: 10,
                      ),
                    ),
                    IconButton(
                      icon: Image.asset("assets/arrowdown2.png"),
                      onPressed: () => showColors(context),
                    ),
                  ],
                ),
              ),
            ),
            OptionListTile(
              tileBorder: kExtremeRaduis,
              title: "Quantity",
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kExtremeRaduis),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(color: appbarSec),
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Image.asset("assets/add.png"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),

                    Text(
                      "$quantity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kExtremeRaduis),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(color: appbarSec),
                        child: RawMaterialButton(
                          onPressed: () {
                            if (quantity > 0) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          child: Image.asset("assets/minus.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              widget.item.description,

              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
                color: Color(0xff272727),
              ),
            ),
            FutureBuilder(
              future: fetchRating(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final rating = snapshot.data!;
                  if (snapshot.data == null) {
                    return Text("No rating found");
                  }
                  return Column(
                    children: [
                      Text("The userId is ${rating.userId}"),
                      Text(rating.comment),
                    ],
                  );
                }
                return Center(child: Text('No data found.'));
              },
            ),
            const Divider(),
            const SizedBox(height: 10),
            Text("Shipping", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),

            Text(
              (widget.item.refund)
                  ? "This product is available to replace or to return, and you can get the full refund"
                  : "This product is not available to replace or refund.",
              style: TextStyle(color: Color(0xff272727), fontSize: 12),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Center(
                  child: CustomeElevatedButton(
                    buttonColor: appbarSec,
                    callbackFunction: () {
                      debugPrint("Added to the cart with quantity $quantity");
                      for (int i = 0; i < quantity; i++) {
                        context.read<CartCubit>().addItem(widget.item);
                      }
                      setState(() {
                        quantity = 0;
                      });
                    },
                    hintText: "Add to Cart",

                    textColor: Colors.white,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
