import 'package:bloc/bloc.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/order.dart';
import 'package:ecomflutter/Features/HomePage/Data/Repo/order_request_repo.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:meta/meta.dart';

part 'orders_page_state.dart';

class OrdersPageCubit extends Cubit<OrdersPageState> {
  OrdersPageCubit() : super(OrdersPageLoading()) {
    fetchAllOrders();
  }
  void fetchAllOrders() async {
    try {
      List<OrderModel> orders = await sl<OrderRequestRepo>().getAllUserOrders();

      emit(OrdersPageSuccess(orders));
    } catch (e) {
      emit(OrdersPageFailure(e.toString()));
    }
  }
}
