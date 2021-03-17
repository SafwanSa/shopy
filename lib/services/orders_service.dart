import 'package:flutter/material.dart';
import 'package:shopy/models/order.dart';
import 'package:shopy/services/cart_service.dart';

class Orders with ChangeNotifier {
  List<Order> _orders;

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
