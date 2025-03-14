import 'dart:convert';
import 'package:http/http.dart' as http;

class Item {
  String url;
  String description;
  double price;
  String location;
  String name;

  Item({
    required this.url,
    required this.description,
    required this.price,
    required this.location,
    required this.name,
  });
}

List<Item> itemList = [];

Future<void> addItemsToList(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    dynamic responseBody = jsonDecode(response.body);

    // Since the response is a list of items, no need to access 'items' field
    if (responseBody is List) {
      for (var itemData in responseBody) {
        Item newItem = Item(
          // 'image' field holds the image URL
          url: itemData['image'] ?? '',
          // 'description' field for item description
          description: itemData['description'] ?? '',
          // 'price' field holds the price
          price: itemData['price']?.toDouble() ?? 0.0,
          // Static location as required
          location: "Ali Baba",
          // 'title' holds the name of the product
          name: itemData['title'] ?? '',
        );

        itemList.add(newItem);
      }
    }
  }
}
