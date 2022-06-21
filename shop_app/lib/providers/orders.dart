import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

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

  List<orderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<cartItem> cartProducts, double total) {
    _orders.insert(
      0,
      orderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
