import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';

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
              setState(() {
                _favoritesOnly = option == FavoriteOption.favorite;
              });
              debugPrint(option.toString());
            },
          ),
        ],
      ),
      body: ProductGrid(favoritesOnly: _favoritesOnly),
    );
  }
}
