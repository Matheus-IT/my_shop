import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de compras'),
      ),
      body: Column(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(width: 8.0),
                Chip(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: Consumer<CartProvider>(
                    builder: (_, cartProvider, __) => Text(
                      'R\$ ${cartProvider.total}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('Comprar'),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
