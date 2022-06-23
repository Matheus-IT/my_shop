import 'package:flutter/material.dart';
import '../providers/product_provider.dart';

import 'product_tile.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = ProductProvider.fetchProducts();
    return GridView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ProductTile(
        products[index],
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}
