import 'dart:math';

import 'package:shop_app/models/product.dart';

class CartItem {
  final itemId;
  final int productId;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  static int nextId() => Random().nextInt(1000) + 1000;

  factory CartItem.fromProduct(Product product) {
    return CartItem(
      itemId: nextId(),
      productId: product.id,
      name: product.name,
      // quantity: quantity ?? 1,
      quantity: 1,
      price: product.price,
    );
  }
}
