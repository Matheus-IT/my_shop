import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

import 'product_tile.dart';

class ProductGrid extends StatelessWidget {
  final bool favoritesOnly;

  const ProductGrid({
    Key? key,
    required this.favoritesOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final products = favoritesOnly
        ? provider.products.where((p) => p.isFavorite).toList()
        : provider.products;

    return GridView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: const ProductTile(),
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
