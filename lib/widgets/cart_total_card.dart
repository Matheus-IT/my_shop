import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartTotalCard extends StatelessWidget {
  const CartTotalCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 10.0,
        bottom: 15.0,
        left: 15.0,
        right: 15.0,
      ),
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
                  'R\$ ${cartProvider.total.toStringAsFixed(2)}',
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
    );
  }
}
