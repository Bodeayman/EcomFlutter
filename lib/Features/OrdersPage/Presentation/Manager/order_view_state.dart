part of 'order_view_cubit.dart';

@immutable
sealed class OrderViewState {}

final class OrderViewSuccess extends OrderViewState {
  List<Item> productNames;
  OrderViewSuccess(this.productNames);
}

final class OrderViewInitial extends OrderViewState {}

final class OrderViewLoading extends OrderViewState {}
