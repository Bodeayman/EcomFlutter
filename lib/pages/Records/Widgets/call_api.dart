import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApi extends StatelessWidget {
  const CallApi({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final response = await http.get(
          Uri.parse("http://localhost:5000/api/products"),
        );
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        print(jsonResponse["message"]);
      },
      child: Text("Click here"),
    );
  }
}
