// providers/cart_provider.dart
import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  final String price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};
  int get itemCount => _items.length;

  void addItem(Map<String, dynamic> product) {
    if (_items.containsKey(product['name'])) {
      _items.update(
        product['name'],
        (existing) => CartItem(
          name: existing.name,
          image: existing.image,
          price: existing.price,
          quantity: existing.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product['name'],
        () => CartItem(
          name: product['name'],
          image: product['image'],
          price: product['price'],
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
