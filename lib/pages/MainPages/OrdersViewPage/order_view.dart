import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/model/order.dart';
import 'package:ecomflutter/pages/MainPages/OrdersViewPage/Widgets/order_status.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key, required this.order});
  final Order order;

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
                SizedBox(
                  height: 40,
                  width: 40,
                  child: InkWell(
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
                ),

                Expanded(
                  child: Center(
                    child: Text(
                      "Order #${order.id}",
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
            OrderStatus(),
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
                    title: "${order.items.length} items",
                    leading: Icon(Icons.receipt),
                    trailing: TextButton(
                      child: Text("View all"),
                      onPressed: () {},
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
                child: Center(child: OptionListTile(title: order.location)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
