part of 'orders_page_cubit.dart';

@immutable
sealed class OrdersPageState {}

final class OrdersPageLoading extends OrdersPageState {}

final class OrdersPageFailure extends OrdersPageState {
  final String errMessage;
  OrdersPageFailure(this.errMessage);
}

final class OrdersPageSuccess extends OrdersPageState {
  final List<OrderModel> orders;
  OrdersPageSuccess(this.orders);
}
