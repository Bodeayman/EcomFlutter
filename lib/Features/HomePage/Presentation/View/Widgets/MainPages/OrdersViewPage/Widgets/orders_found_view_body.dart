import 'package:ecomflutter/Features/HomePage/Presentation/Manager/orders_page_cubit.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/Widgets/MainPages/OrdersViewPage/Widgets/allTabs.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/View/Widgets/MainPages/OrdersViewPage/order_view.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersFoundViewBody extends StatelessWidget {
  const OrdersFoundViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    return OptionListTile(
                      leading: const Icon(Icons.receipt),
                      title: 'Order ${order.id}',
                      subtitle: '${order.products.length} Items',
                      trailing: IconButton(
                        icon: Image.asset('assets/arrowright2.png'),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => OrderView(orderModel: order),
                            ),
                          );
                        },
                      ),
                    );
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
    );
  }
}
