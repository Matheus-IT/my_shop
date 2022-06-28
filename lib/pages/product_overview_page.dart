import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Exemplo'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text('Favoritos')),
              const PopupMenuItem(child: Text('Todos')),
            ],
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
