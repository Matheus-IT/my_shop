import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_item.dart';
import 'package:shop_app/models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, CartItem> _cart = {};

  void addItem(Product product) {
    // Long implementation:
    //if (_cart.containsKey(product.id)) {
    //  _cart.update(
    //    product.id,
    //    (cartItem) =>
    //        CartItem.from(cartItem, newQuantity: cartItem.quantity + 1),
    //  );
    //} else {
    //  _cart.putIfAbsent(product.id, () => CartItem.fromProduct(product));
    //}

    // Short implementation:
    _cart.update(
      product.id,
      (cartItem) => CartItem.from(cartItem, newQuantity: cartItem.quantity + 1),
      ifAbsent: () => CartItem.fromProduct(product),
    );

    notifyListeners();
  }
}
