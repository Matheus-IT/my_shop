import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/widgets/cart_item.dart';

import '../providers/cart_provider.dart';
import '../widgets/cart_total_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de compras'),
      ),
      body: Column(children: [
        const CartTotalCard(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CartItem(item: cartItems[index]);
            },
            itemCount: cart.itemCount,
          ),
        ),
      ]),
    );
  }
}
