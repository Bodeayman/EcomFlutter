import 'package:flutter/material.dart';
import 'package:ecomflutter/model/item.dart';

class Cart extends ChangeNotifier {
  double totalPrice = 0;

  Map<Item, int> selectedElements = {};

  void addElementToCart(Item product) {
    selectedElements[product] = (selectedElements[product] ?? 0) + 1;

    totalPrice += convertNumber(product.price);
    debugPrint("$totalPrice");

    notifyListeners();
  }

  void removeElementFromCart(Item product) {
    if (selectedElements.containsKey(product) &&
        selectedElements[product]! > 1) {
      selectedElements[product] = selectedElements[product]! - 1;
    } else {
      selectedElements.remove(product);
    }
    totalPrice -= (convertNumber(product.price));
    notifyListeners();
  }

  bool isInCart(Item item) {
    return selectedElements.containsKey(item);
  }

  void clearCart() {
    selectedElements.clear();
    notifyListeners();
  }
}

double convertNumber(double value) {
  return value.truncateToDouble();
  // value = double.parse(value.truncateToDouble());
  // return value;
}
