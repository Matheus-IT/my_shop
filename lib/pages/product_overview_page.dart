import 'package:flutter/material.dart';
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
          BadgeCart(
              value: 7,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
              )),
        ],
      ),
      body: ProductGrid(favoritesOnly: _favoritesOnly),
    );
  }
}

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
