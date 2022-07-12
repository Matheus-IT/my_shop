import 'dart:math';

import 'package:shop_app/models/product_model.dart';

class CartModel {
  final itemId;
  final int productId;
  final String name;
  final int quantity;
  final double price;

  CartModel({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  CartModel.from(CartModel cartItem, {int newQuantity = 1})
      : itemId = cartItem.itemId,
        productId = cartItem.productId,
        name = cartItem.name,
        price = cartItem.price,
        quantity = newQuantity;

  static int _nextId() => Random().nextInt(1000) + 1000;

  factory CartModel.fromProduct(ProductModel product, {int quantity = 1}) {
    return CartModel(
      itemId: _nextId(),
      productId: product.id,
      name: product.name,
      quantity: quantity,
      price: product.price,
    );
  }
}
