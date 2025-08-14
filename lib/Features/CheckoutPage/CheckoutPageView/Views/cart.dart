import 'package:ecomflutter/Features/SearchPage/Widgets/shop_by_categories_view.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Manager/cart_cubit.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Views/Widgets/checkout_price.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Views/Widgets/enter_coupon_widget.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Views/checkout.dart';
import 'package:ecomflutter/Features/OnBoardingPage/Widgets/login_material_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPriceCart = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.selectedItems.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawMaterialButton(
                            onPressed: () => {context.pop()},
                            constraints: BoxConstraints.tightFor(
                              width: 50,
                              height: 50,
                            ),
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
                          Expanded(
                            child: Center(
                              child: Text(
                                "Cart",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 40, height: 40),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: context.read<CartCubit>().clearCart,
                            child: Text(
                              "Remove all",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              state.selectedItems.entries.map((item) {
                                final product = item.key;

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    kSettingsTile,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    color: Colors.grey[200],
                                    padding: const EdgeInsets.all(10),
                                    child: ListTile(
                                      style: ListTileStyle.drawer,
                                      title: Text(
                                        product.name,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text("Size-M Color-L"),
                                      leading: Image.network(
                                        product.url,
                                        fit: BoxFit.cover,
                                      ),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$${product.price * item.value}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          /////////////////
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      kExtremeRaduis,
                                                    ),
                                                child: Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                    color: appbarSec,
                                                  ),
                                                  child: RawMaterialButton(
                                                    onPressed: () {
                                                      context
                                                          .read<CartCubit>()
                                                          .addItem(product);
                                                    },
                                                    child: Image.asset(
                                                      "assets/add.png",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      kExtremeRaduis,
                                                    ),
                                                child: Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                    color: appbarSec,
                                                  ),
                                                  child: RawMaterialButton(
                                                    onPressed: () {
                                                      context
                                                          .read<CartCubit>()
                                                          .removeItem(product);
                                                    },
                                                    child: Image.asset(
                                                      "assets/minus.png",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      contentPadding: const EdgeInsets.all(20),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    CheckoutPriceList(),
                    EnterCouponWidget(),

                    const SizedBox(height: 30),
                    SizedBox(
                      height: 52,
                      width: double.infinity,
                      child: CustomeElevatedButton(
                        buttonColor: appbarSec,
                        hintText: "Checkout",
                        textColor: Colors.white,
                        callbackFunction:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => CheckoutPage(totalPrice: 200),
                              ),
                            ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Column(
                    children: [
                      Image.asset("assets/noCart.png"),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          "Your cart is empty",
                          style: TextStyle(
                            fontSize: kNoTextSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 52,
                        width: 195,
                        child: CustomeElevatedButton(
                          buttonColor: appbarSec,
                          hintText: "Explore Categories",
                          textColor: Colors.white,
                          callbackFunction: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ShopByCategoriesView(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


/*
   Consumer<Cart>(
              builder: (context, value, child) {
                if (value.selectedElements.isNotEmpty) {

                } else {
                 
                }
              },
            ),
 */