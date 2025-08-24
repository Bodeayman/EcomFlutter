import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Manager/cart_cubit.dart';
import 'package:ecomflutter/Features/DetailsPage/Widgets/details_view_functions.dart';
import 'package:ecomflutter/Features/OnBoardingPage/Widgets/login_material_button.dart';
import 'package:ecomflutter/utils/widgets/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/Features/ProductsPage/Data/Models/item.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Details extends StatefulWidget {
  final Item item;
  const Details({super.key, required this.item});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.item.id);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RawMaterialButton(
              onPressed: () => {context.pop()},
              constraints: BoxConstraints.tightFor(width: 50, height: 50),
              shape: CircleBorder(),
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
            SizedBox(
              height: 65,

              child: OptionListTile(
                tileBorder: kExtremeRaduis,

                title: "Size",
                trailing: SizedBox(
                  width: 60,
                  child: IconButton(
                    icon: Image.asset("assets/arrowdown2.png"),
                    onPressed: () => showSizes(context, widget.item.sizes),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 65,

              child: OptionListTile(
                tileBorder: kExtremeRaduis,

                title: "Color",
                trailing: SizedBox(
                  width: 55,
                  child: IconButton(
                    icon: Image.asset("assets/arrowdown2.png"),
                    onPressed: () => showColors(context, widget.item.colors),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 65,
              child: OptionListTile(
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
            const SizedBox(height: 10),
            Text("Shipping", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),

            Text(
              "This product is available to replace or to return, and you can get the full refund",
              style: TextStyle(color: Color(0xff272727), fontSize: 12),
            ),
            const SizedBox(height: 20),
            Text("Reviews", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(
              "213 Reviews",
              style: TextStyle(color: kTextInsideForm, fontSize: 12.0),
            ),
            const SizedBox(height: 5),
            Text(
              "This thing is great is doing the thing that required too, and it provides all the options that you need to make",
              style: TextStyle(color: kTextInsideForm, fontSize: 12.0),
            ),
            const SizedBox(height: 10),

            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: CustomeElevatedButton(
                    buttonColor: appbarSec,
                    callbackFunction: () {
                      if (quantity == 0) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.info(
                            message: "Please add items to the cart",
                          ),
                        );
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(message: "Added to the cart"),
                        );
                      }

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
