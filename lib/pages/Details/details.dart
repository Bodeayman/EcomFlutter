import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:ecomflutter/shared/appbar.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            ClipRRect(
              borderRadius: BorderRadius.circular(kExtremeRaduis),
              child: OptionListTile(
                title: "Size",
                trailing: Image.asset("assets/arrowdown2.png"),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(kExtremeRaduis),
              child: OptionListTile(
                title: "Color",
                trailing: Image.asset("assets/arrowdown2.png"),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(kExtremeRaduis),
              child: OptionListTile(
                title: "Quantity",
                trailing: Image.asset("assets/arrowdown2.png"),
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
            const Divider(),
            Text("Shipping", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "This product is available to replace or to return, and you can get the full refund",
            ),
            const SizedBox(height: 20),
            Consumer<Cart>(
              builder: (context, value, child) {
                return CustomeElevatedButton(
                  buttonColor: appbarSec,
                  callbackFunction: () => value.addElementToCart(widget.item),
                  hintText: "Add to Cart",

                  textColor: Colors.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
