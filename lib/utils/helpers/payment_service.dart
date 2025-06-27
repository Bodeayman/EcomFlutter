import 'dart:convert';

import 'package:ecomflutter/utils/api_key.dart';
import 'package:ecomflutter/utils/helpers/token_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String?> requestPaymentToken() async {
  final response = await http.post(
    Uri.parse("https://accept.paymob.com/api/auth/tokens"),
    body: jsonEncode({"api_key": paymobApiKey}),
    headers: {"Content-Type": "application/json"},
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    final String paymentToken = jsonDecode(response.body)["token"];
    debugPrint(paymentToken);
    await storePaymentToken(paymentToken);
    return paymentToken;
  }
  return null;
}

Future<String?> requestPaymentKey({
  required String authToken,
  required int amountCents,
  required int orderId,
  required int integrationId,
}) async {
  final url = Uri.parse(
    "https://accept.paymob.com/api/acceptance/payment_keys",
  );

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "auth_token": authToken,
      "amount_cents": amountCents,
      "expiration": 3600,
      "order_id": orderId,
      "billing_data": {
        "apartment": "NA",
        "email": "customer@example.com",
        "floor": "NA",
        "first_name": "John",
        "street": "NA",
        "building": "NA",
        "phone_number": "01234567890",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": "Doe",
        "state": "NA",
      },
      "currency": "EGP",
      "integration_id": integrationId,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return data["token"];
  } else {
    print("Error: ${response.statusCode}");
    print("Body: ${response.body}");
    return null;
  }
}

Future<int?> createPaymobOrder({
  required String authToken,
  required int amountCents,
}) async {
  final url = Uri.parse("https://accept.paymob.com/api/ecommerce/orders");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "auth_token": authToken,
      "delivery_needed": "false",
      "amount_cents": amountCents,
      "currency": "EGP",
      "items": [],
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    final data = jsonDecode(response.body);
    final orderId = data["id"];
    print("Order created. ID: $orderId");
    return orderId;
  } else {
    print("Failed to create order. Status: ${response.statusCode}");
    print("Response body: ${response.body}");
    return null;
  }
}
