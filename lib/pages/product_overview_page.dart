import 'package:flutter/material.dart';

import '../providers/product_provider.dart';
import '../widgets/product_grid.dart';

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = ProductProvider.fetchProducts();

    return Scaffold(
      appBar: AppBar(title: const Text('Loja Exemplo')),
      body: ProductGrid(products: products),
    );
  }
}
