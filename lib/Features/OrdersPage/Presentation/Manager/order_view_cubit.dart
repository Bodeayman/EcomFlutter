import 'package:bloc/bloc.dart';
import 'package:ecomflutter/Features/OrdersPage/Data/Models/order.dart';
import 'package:ecomflutter/Features/OrdersPage/Data/Repo/order_request_repo.dart';
import 'package:ecomflutter/Features/ProductsPage/Data/Models/item.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'order_view_state.dart';

class OrderViewCubit extends Cubit<OrderViewState> {
  OrderViewCubit() : super(OrderViewInitial());
  void returnItemModelsPerOrder(int id) async {
    emit(OrderViewLoading());
    final List<int> productIds = await sl<OrderRequestRepo>()
        .fetchOrderProducts(id);
    final productsBox = Hive.box<Item>('allProducts');
    final List<Item> products = productsBox.values.toList();
    emit(
      OrderViewSuccess(
        products.where((e) => productIds.contains(e.id)).toList(),
      ),
    );
  }
}
