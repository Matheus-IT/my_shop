import 'package:flutter/material.dart';

import '../models/product_model.dart';
import './dummy_products.dart';

class ProductProvider extends ChangeNotifier {
  // final List<Product> _products = List<Product>.from(dummyData);
  final List<ProductModel> _products = [...dummyData];

  List<ProductModel> get products => _products;
}
