import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

import '../core/app_routes.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile();

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final Product product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, _) {
              return IconButton(
                onPressed: product.toggleFavorite,
                icon: Icon(
                  product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                ),
                color: secondaryColor,
              );
            },
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product);
              print(cart.itemCount);
            },
            icon: const Icon(Icons.shopping_cart),
            color: secondaryColor,
          ),
          title: Text(product.name),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.productDetail,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
