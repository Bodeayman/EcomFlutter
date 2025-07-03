import 'package:ecomflutter/Features/OrdersPage/Presentation/Manager/orders_page_cubit.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Views/OrdersViewPage/Widgets/allTabs.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Views/OrdersViewPage/Widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersFoundViewBody extends StatelessWidget {
  const OrdersFoundViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<OrdersPageCubit>().fetchAllOrders(),
      child: SafeArea(
        child: BlocBuilder<OrdersPageCubit, OrdersPageState>(
          builder: (context, state) {
            if (state is OrdersPageSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                itemCount: state.orders.length + 1, // +1 for header
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // This is the header
                    return Column(
                      children: const [
                        SizedBox(height: 40),
                        Center(
                          child: Text(
                            'Orders',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 40),
                        SizedBox(height: 30, child: AllTabsWidget()),
                        SizedBox(height: 50),
                      ],
                    );
                  }
                  final order = state.orders[index - 1];
                  return OrderTile(order: order);
                },
              );
            } else if (state is OrdersPageFailure) {
              return const Center(child: Text("Failed to load orders"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
