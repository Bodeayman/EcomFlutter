part of 'cart_cubit.dart';

@immutable
class CartState {
  final Map<Item, int> selectedItems;
  final double totalPrice;
  final bool appliedCoupon;

  const CartState({
    required this.selectedItems,
    required this.totalPrice,
    required this.appliedCoupon,
  });

  CartState copyWith({
    Map<Item, int>? selectedItems,
    double? totalPrice,
    bool? appliedCoupon,
  }) {
    return CartState(
      appliedCoupon: appliedCoupon ?? this.appliedCoupon,
      selectedItems: selectedItems ?? this.selectedItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

class CartInitial extends CartState {
  CartInitial() : super(selectedItems: {}, totalPrice: 0, appliedCoupon: false);
}
