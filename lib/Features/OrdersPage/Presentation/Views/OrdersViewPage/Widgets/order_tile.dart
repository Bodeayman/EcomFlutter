import 'package:ecomflutter/Features/OrdersPage/Data/Models/order.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Manager/orders_page_cubit.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Views/OrdersViewPage/order_view.dart';
import 'package:ecomflutter/utils/widgets/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Do you want to delete this Order?"),
                    TextButton(
                      child: Text("No"),
                      onPressed: () => context.pop(),
                    ),
                    TextButton(
                      child: Text("Yes"),
                      onPressed: () {
                        context.read<OrdersPageCubit>().deleteAnOrder(order.id);
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => OrderView(orderModel: order)));
      },
      child: SizedBox(
        height: 80,

        child: OptionListTile(
          leading: const Icon(Icons.receipt),
          title: 'Order ${order.id}',
          subtitle: '${order.products.length} Items',
          trailing: IconButton(
            icon: Image.asset('assets/arrowright2.png'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
