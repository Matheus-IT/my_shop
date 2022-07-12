import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, CartModel> _cart = {};
  int get itemCount => _cart.length;

  Map<int, CartModel> get items => _cart;

  int get quantityCount {
    int sum = 0;
    _cart.forEach((_, item) => sum += item.quantity);
    return sum;
  }

  double get total {
    double sum = 0.0;
    _cart.forEach((key, item) => sum += item.price * item.quantity);
    return sum;
  }

  void addItem(ProductModel product) {
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
      (cartItem) =>
          CartModel.from(cartItem, newQuantity: cartItem.quantity + 1),
      ifAbsent: () => CartModel.fromProduct(product),
    );
    notifyListeners();
  }
}
