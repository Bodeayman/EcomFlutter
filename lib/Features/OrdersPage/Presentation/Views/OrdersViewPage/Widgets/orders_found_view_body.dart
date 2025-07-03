import 'package:ecomflutter/Features/OrdersPage/Data/Models/order.dart';
import 'package:ecomflutter/Features/ProductsPage/Presentation/Manager/main_products_cubit.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Manager/orders_page_cubit.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Views/OrdersViewPage/Widgets/allTabs.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Views/OrdersViewPage/Widgets/order_tile.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Views/OrdersViewPage/order_view.dart';
import 'package:ecomflutter/utils/widgets/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrdersFoundViewBody extends StatelessWidget {
  const OrdersFoundViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<OrdersPageCubit>().fetchAllOrders(),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Orders',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            const SizedBox(height: 30, child: AllTabsWidget()),
            const SizedBox(height: 50),

            BlocBuilder<OrdersPageCubit, OrdersPageState>(
              builder: (context, state) {
                if (state is OrdersPageSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      final order = state.orders[index];
                      return OrderTile(order: order);
                    },
                  );
                } else if (state is OrdersPageFailure) {
                  return Center(child: Text(state.errMessage));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
