import 'dart:convert';

import 'package:ecomflutter/model/item.dart';
import 'package:ecomflutter/model/rating.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Rating>> fetchRating(Item item) async {
  final response = await http.get(
    Uri.parse('http://localhost:5000/api/rating/${item.id}'),
  );
  List<dynamic> data = jsonDecode(response.body);
  List<Rating> ratingOfProduct = [];
  if (response.statusCode == 200) {
    for (dynamic rating in data) {
      ratingOfProduct.add(
        Rating(
          rating["id"],
          rating["rating"],
          rating["comment"],
          rating["user"]["name"],
        ),
      );
    }

    return ratingOfProduct;
  } else {
    throw Exception('Failed to load users');
  }
}
