import 'package:flutter/material.dart';
import 'package:ecomflutter/model/item.dart';

class Cart extends ChangeNotifier {
  double total_Price = 0;

  List<Item> selectedElements = [];

  void add(Item product) {
    selectedElements.add(product);
    total_Price += (product.price);
    notifyListeners();
  }

  void removeElement(Item product) {
    selectedElements.remove(product);
    total_Price -= (product.price);
    notifyListeners();
  }
}
