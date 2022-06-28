import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shop_app/providers/cart.dart';
import 'package:http/http.dart' as http;

class orderItem {
  final String id;
  final double amount;
  final List<cartItem> products;
  final DateTime dateTime;

  orderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<orderItem> _orders = [];

  final String authToken;

  Orders(this.authToken, this._orders);

  List<orderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url =
        'https://shop-app-flutter-a1231-default-rtdb.firebaseio.com/orders.json?auth=$authToken';
    final response = await http.get(Uri.parse(url));
    List<orderItem> loadedOrders = [];
    var extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(orderItem(
        id: orderId,
        amount: orderData['amount'],
        dateTime: DateTime.parse(orderData['dateTime']),
        products: (orderData['product'] as List<dynamic>)
            .map((item) => cartItem(
                id: item['id'],
                price: item['price'],
                quantity: item['quantity'],
                title: item['title']))
            .toList(),
      ));
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<cartItem> cartProducts, double total) async {
    final url =
        'https://shop-app-flutter-a1231-default-rtdb.firebaseio.com/orders.json?auth=$authToken';
    final timeStamp = DateTime.now();
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'amount': total,
          'dateTime': DateTime.now().toIso8601String(),
          'product': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList()
        }));
    _orders.insert(
      0,
      orderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
