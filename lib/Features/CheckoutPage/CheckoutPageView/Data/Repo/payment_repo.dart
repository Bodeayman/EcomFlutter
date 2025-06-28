import 'package:ecomflutter/utils/api_key.dart';
import 'package:ecomflutter/utils/api_service.dart';

import 'package:ecomflutter/utils/helpers/token_service.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:flutter/material.dart';

class PaymentRepo {
  final HttpApiService _apiService = sl<HttpApiService>();
  Future<String> requestPayment(int totalPrice) async {
    String paymentToken = await _requestPaymentToken() ?? "";
    int orderId =
        await _createPaymobOrder(
          amountCents: totalPrice * 100,
          authToken: paymentToken,
        ) ??
        0;
    String paymentKey =
        await _requestPaymentKey(
          amountCents: totalPrice * 100,
          authToken: paymentToken,
          integrationId: integrationIdPayment,
          orderId: orderId,
        ) ??
        "";
    return 'https://accept.paymob.com/api/acceptance/iframes/$IframeId?payment_token=$paymentKey';
  }

  Future<String?> _requestPaymentToken() async {
    try {
      final response = await _apiService.post(
        url: "https://accept.paymob.com/api/auth/tokens",
        body: {"api_key": paymobApiKey},
      );
      debugPrint("Printted successfully");
      debugPrint(response.data.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final String paymentToken = response.data["token"];
        debugPrint(paymentToken);
        await storePaymentToken(paymentToken);
        return paymentToken;
      }
      return null;
    } catch (e) {
      debugPrint("error here");
      debugPrint(e.toString());
    }
    return null;
  }

  Future<String?> _requestPaymentKey({
    required String authToken,
    required int amountCents,
    required int orderId,
    required int integrationId,
  }) async {
    final url = "https://accept.paymob.com/api/acceptance/payment_keys";

    final response = await _apiService.post(
      url: url.toString(),
      body: {
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
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      return data["token"];
    } else {
      print("Error: ${response.statusCode}");
      print("Body: ${response.data}");
      return null;
    }
  }

  Future<int?> _createPaymobOrder({
    required String authToken,
    required int amountCents,
  }) async {
    final url = "https://accept.paymob.com/api/ecommerce/orders";

    final response = await _apiService.post(
      url: url,
      body: {
        "auth_token": authToken,
        "delivery_needed": "false",
        "amount_cents": amountCents,
        "currency": "EGP",
        "items": [],
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      final orderId = data["id"];
      print("Order created. ID: $orderId");
      return orderId;
    } else {
      print("Failed to create order. Status: ${response.statusCode}");
      print("Response body: ${response.data}");
      return null;
    }
  }
}
