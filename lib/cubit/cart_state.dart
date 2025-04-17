part of 'cart_cubit.dart';

@immutable
class CartState {
  final Map<Item, int> selectedItems;
  final double totalPrice;

  const CartState({required this.selectedItems, required this.totalPrice});

  CartState copyWith({Map<Item, int>? selectedItems, double? totalPrice}) {
    return CartState(
      selectedItems: selectedItems ?? this.selectedItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

class CartInitial extends CartState {
  CartInitial() : super(selectedItems: {}, totalPrice: 0);
}
