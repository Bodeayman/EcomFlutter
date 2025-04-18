import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ecomflutter/model/item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  /// Utility function to make price whole number
  double convertNumber(double value) {
    return value.truncateToDouble();
  }

  /// Adds an item to the cart or increases its quantity
  void addItem(Item product) {
    final updatedCart = Map<Item, int>.from(state.selectedItems);
    updatedCart[product] = (updatedCart[product] ?? 0) + 1;

    final updatedTotal = state.totalPrice + convertNumber(product.price);
    emit(state.copyWith(selectedItems: updatedCart, totalPrice: updatedTotal));
  }

  /// Removes one quantity or the item entirely if quantity == 1
  void removeItem(Item product) {
    final updatedCart = Map<Item, int>.from(state.selectedItems);

    if (updatedCart.containsKey(product)) {
      if (updatedCart[product]! > 1) {
        updatedCart[product] = updatedCart[product]! - 1;
      } else {
        updatedCart.remove(product);
      }

      final updatedTotal = state.totalPrice - convertNumber(product.price);
      emit(
        state.copyWith(selectedItems: updatedCart, totalPrice: updatedTotal),
      );
    }
  }

  void applyDiscount() {
    emit(state.copyWith(totalPrice: state.totalPrice - state.totalPrice / 10));
  }

  /// Checks if an item is in the cart
  bool isInCart(Item product) {
    return state.selectedItems.containsKey(product);
  }

  /// Clears the entire cart
  void clearCart() {
    emit(state.copyWith(selectedItems: {}, totalPrice: 0));
  }
}
