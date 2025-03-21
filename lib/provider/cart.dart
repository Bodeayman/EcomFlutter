import 'package:flutter/material.dart';
import 'package:ecomflutter/model/item.dart';

class Cart extends ChangeNotifier {
  double totalPrice = 0;

  List<Item> selectedElements = [];

  void addElementToCart(Item product) {
    selectedElements.add(product);
    totalPrice += (convertNumber(product.price));
    notifyListeners();
  }

  void removeElementFromCart(Item product) {
    selectedElements.remove(product);
    totalPrice -= (convertNumber(product.price));
    notifyListeners();
  }
}

double convertNumber(double value) {
  value = double.parse(value.toStringAsFixed(2));
  return value;
}
