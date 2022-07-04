import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/app_routes.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/widgets/badge_cart.dart';

import '../widgets/product_grid.dart';

enum FavoriteOption { favorite, all }

class ProductOverviewPage extends StatefulWidget {
  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  bool _favoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final hint = _favoritesOnly ? 'todos' : 'favoritos';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Exemplo'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() => _favoritesOnly = !_favoritesOnly);
            },
            tooltip: 'Clique para exibir $hint',
            icon: Icon(
              _favoritesOnly ? Icons.favorite : Icons.favorite_border,
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return BadgeCart(
                value: cart.itemCount,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    AppRoutes.cart,
                  ),
                  tooltip: 'R\$${cart.total.toStringAsFixed(2)} no total',
                  icon: const Icon(Icons.shopping_cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ProductGrid(favoritesOnly: _favoritesOnly),
    );
  }
}

// Old implementation:
//PopupMenuButton<FavoriteOption>(
//  itemBuilder: (_) => [
//    const PopupMenuItem(
//      value: FavoriteOption.favorite,
//      child: Text('Favoritos'),
//    ),
//    const PopupMenuItem(
//      value: FavoriteOption.all,
//      child: Text('Todos'),
//    ),
//  ],
//  onSelected: (option) {
//    setState(() {
//      _favoritesOnly = option == FavoriteOption.favorite;
//    });
//    debugPrint(option.toString());
//  },
//),
