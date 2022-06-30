import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, CartItem> _cart = {};
}
