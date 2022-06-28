import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';

import '../widgets/product_grid.dart';

enum FavoriteOption { favorite, all }

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Exemplo'),
        actions: [
          PopupMenuButton<FavoriteOption>(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FavoriteOption.favorite,
                child: Text('Favoritos'),
              ),
              const PopupMenuItem(
                value: FavoriteOption.all,
                child: Text('Todos'),
              ),
            ],
            onSelected: (option) {
              if (option == FavoriteOption.favorite) {
                provider.favoriteOnly(true);
              } else {
                provider.favoriteOnly(false);
              }
              debugPrint(option.toString());
            },
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
