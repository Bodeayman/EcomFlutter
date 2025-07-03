import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/Features/OrdersPage/Data/Models/order.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Views/OrdersViewPage/Widgets/order_status.dart';
import 'package:ecomflutter/utils/widgets/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                Expanded(
                  child: Center(
                    child: Text(
                      "Order #${orderModel.id}",
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
            OrderStatus(orderModel: orderModel),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Order Items",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 72,
              child: Expanded(
                child: Center(
                  child: OptionListTile(
                    title: "items",
                    leading: Icon(Icons.receipt),
                    trailing: TextButton(
                      child: Text("View all"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: SizedBox(
                                height: 300,
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize:
                                        MainAxisSize
                                            .min, // Prevents full screen
                                    children:
                                        orderModel.products.map((orderItem) {
                                          final item = orderItem.itemId;
                                          return ListTile(
                                            leading: const Icon(
                                              Icons.shopping_bag,
                                            ),
                                            title: Text("Item $item"),
                                            subtitle: Text(
                                              'Quantity: ${orderItem.quantity}',
                                            ),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Shipping Details",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 72,
              child: Expanded(
                child: Center(child: OptionListTile(title: orderModel.address)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
