import 'package:ecomflutter/model/order.dart';
import 'package:ecomflutter/model/repoOrder/getallOrders.dart';
import 'package:ecomflutter/model/repoRating/getallrating.dart';
import 'package:ecomflutter/pages/MainPages/OrdersViewPage/Widgets/allTabs.dart';
import 'package:ecomflutter/pages/MainPages/OrdersViewPage/order_view.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersFoundViewBody extends StatelessWidget {
  OrdersFoundViewBody({super.key});
  final List<Order> orders = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text("Orders", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 40),
        SizedBox(height: 30, child: AllTabsWidget()),
        const SizedBox(height: 20),

        Expanded(
          child: FutureBuilder(
            future: getAllOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final orders = snapshot.data!;
                if (orders.isEmpty) {
                  return Center(child: Text("No Orders found"));
                }
                return SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 5),
                        child: OptionListTile(
                          leading: Icon(Icons.receipt),
                          title: "Order #${orders[index].id}",
                          trailing: IconButton(
                            icon: Image.asset("assets/arrowright2.png"),
                            onPressed:
                                () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            OrderView(order: orders[index]),
                                  ),
                                ),
                          ),
                        ),
                      );
                    },
                    itemCount: orders.length,
                  ),
                );
              }
              return Center(child: Text('No data found.'));
            },
          ),
        ),
      ],
    );
  }
}
