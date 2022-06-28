import 'package:flutter/material.dart';

import '../models/product.dart';
import './dummy_products.dart';

class ProductProvider extends ChangeNotifier {
  // final List<Product> _products = List<Product>.from(dummyData);
  final List<Product> _products = [...dummyData];
  bool _favoriteOnly = false;

  List<Product> get products {
    if (_favoriteOnly) {
      return _products.where((product) => product.isFavorite).toList();
    }
    return _products;
  }

  void favoriteOnly(bool flag) {
    _favoriteOnly = flag;
    notifyListeners();
  }
}
