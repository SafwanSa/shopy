import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items == null ? 0 : _items.length;
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void remoteSingleItem(String producitId) {
    if (!_items.containsKey(producitId)) {
      return;
    }

    if (_items[producitId].quantity > 1) {
      _items.update(
        producitId,
        (exitingCartItem) => CartItem(
          id: exitingCartItem.id,
          title: exitingCartItem.id,
          quantity: exitingCartItem.quantity - 1,
          price: exitingCartItem.price,
        ),
      );
    } else {
      _items.remove(producitId);
    }
    notifyListeners();
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void addItem({String id, double price, String title}) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          title: title,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
