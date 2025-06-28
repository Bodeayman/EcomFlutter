part of 'orders_page_cubit.dart';

@immutable
sealed class OrdersPageState {}

final class OrdersPageLoading extends OrdersPageState {}

final class OrdersPageFailure extends OrdersPageState {
  final String errMessage;
  OrdersPageFailure(this.errMessage);
}

final class OrdersPageSuccess extends OrdersPageState {
  final List<Map<String, dynamic>> orders;
  OrdersPageSuccess(this.orders);
}
