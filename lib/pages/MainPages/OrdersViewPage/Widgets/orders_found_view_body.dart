import 'package:ecomflutter/pages/MainPages/OrdersViewPage/Widgets/allTabs.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';

class OrdersFoundViewBody extends StatelessWidget {
  const OrdersFoundViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text("Orders", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 40),
        SizedBox(height: 30, child: AllTabsWidget()),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              const SizedBox(height: 40),
              OptionListTile(
                leading: Icon(Icons.receipt),
                title: "Order #40434",
                subtitle: "4 Items",
                trailing: IconButton(
                  icon: Image.asset("assets/arrowright2.png"),
                  onPressed: () {},
                ),
              ),
              OptionListTile(
                leading: Icon(Icons.receipt),
                title: "Order #40434",
                subtitle: "4 Items",
                trailing: IconButton(
                  icon: Image.asset("assets/arrowright2.png"),
                  onPressed: () {},
                ),
              ),
              OptionListTile(
                leading: Icon(Icons.receipt),
                title: "Order #40434",
                subtitle: "4 Items",
                trailing: IconButton(
                  icon: Image.asset("assets/arrowright2.png"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
