import 'package:bloc/bloc.dart';
import 'package:ecomflutter/Features/OrdersPage/Data/Models/order.dart';
import 'package:ecomflutter/Features/OrdersPage/Data/Repo/order_request_repo.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'orders_page_state.dart';

class OrdersPageCubit extends Cubit<OrdersPageState> {
  OrdersPageCubit() : super(OrdersPageLoading()) {
    fetchAllOrders();
  }
  void fetchAllOrders() async {
    try {
      emit(OrdersPageLoading());

      List<OrderModel> orders = await sl<OrderRequestRepo>().getAllUserOrders();
      emit(OrdersPageSuccess(orders));
    } catch (e) {
      emit(OrdersPageFailure(e.toString()));
    }
  }

  void deleteAnOrder(int id) async {
    try {
      await sl<OrderRequestRepo>().deleteOrder(id);
      fetchAllOrders(); // refresh
    } catch (e) {
      debugPrint("Failed to delete order: $e");
      emit(OrdersPageFailure("Failed to delete the Order"));
    }
  }
}
