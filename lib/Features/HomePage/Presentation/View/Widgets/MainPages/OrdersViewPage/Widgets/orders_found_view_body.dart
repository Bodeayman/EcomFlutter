import 'package:ecomflutter/Features/HomePage/Data/Models/order.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/Manager/orders_page_cubit.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/Widgets/MainPages/OrdersViewPage/Widgets/allTabs.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/Widgets/MainPages/OrdersViewPage/order_view.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrdersFoundViewBody extends StatelessWidget {
  const OrdersFoundViewBody({super.key});
  // final List<Order> orders = [
  //   Order(12294, 2000, ["Item1", "Item2", "Item3"], "Saudi Arabia"),
  //   Order(32912, 3000, ["Item4", "Item5", "Item6"], "UAE"),
  //   Order(11302, 4000, ["Item7", "Item8", "Item9"], "New delhi"),
  // ];
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
            child: BlocBuilder<OrdersPageCubit, OrdersPageState>(
              builder: (context, state) {
                if (state is OrdersPageSuccess) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return OptionListTile(
                        leading: Icon(Icons.receipt),
                        title: "Order",
                        subtitle: "Items",
                        trailing: IconButton(
                          icon: Image.asset("assets/arrowright2.png"),
                          onPressed:
                              () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => OrderView(
                                        order: Order(1, 2, [], "d"),
                                      ),
                                ),
                              ),
                        ),
                      );
                    },
                    itemCount: state.orders.length,
                  );
                } else if (state is OrdersPageFailure) {
                  return Center(child: Text(state.errMessage));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ],
    );
  }
}
