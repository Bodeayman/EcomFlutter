import 'package:ecomflutter/model/order.dart';
import 'package:ecomflutter/pages/MainPages/OrdersViewPage/Widgets/allTabs.dart';
import 'package:ecomflutter/pages/MainPages/OrdersViewPage/order_view.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersFoundViewBody extends StatelessWidget {
  OrdersFoundViewBody({super.key});
  final List<Order> orders = [
    Order(12294, 2000, ["Item1", "Item2", "Item3"], "Saudi Arabia"),
    Order(32912, 3000, ["Item4", "Item5", "Item6"], "UAE"),
    Order(11302, 4000, ["Item7", "Item8", "Item9"], "New delhi"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text("Orders", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 40),
        SizedBox(height: 30, child: AllTabsWidget()),
        const SizedBox(height: 50),
        Expanded(
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return OptionListTile(
                  leading: Icon(Icons.receipt),
                  title: "Order #${orders[index].id}",
                  subtitle: "${orders[index].items.length} Items",
                  trailing: IconButton(
                    icon: Image.asset("assets/arrowright2.png"),
                    onPressed:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => OrderView(order: orders[index]),
                          ),
                        ),
                  ),
                );
              },
              itemCount: orders.length,
            ),
          ),
        ),
      ],
    );
  }
}
