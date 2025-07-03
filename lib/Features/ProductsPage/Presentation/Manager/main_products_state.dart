part of 'main_products_cubit.dart';

@immutable
sealed class MainProductsState {}

final class MainProductsInitial extends MainProductsState {}

final class MainProductsLoading extends MainProductsState {}

final class MainProductsSuccess extends MainProductsState {
  final List<Item> data;
  MainProductsSuccess(this.data);
}

final class MainProductsFailure extends MainProductsState {
  final String errMessage;
  MainProductsFailure(this.errMessage);
}
