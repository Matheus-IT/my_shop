import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  final CartModel item;

  const CartItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.itemId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        padding: const EdgeInsets.only(right: 20.0),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      onDismissed: (_) {
        final cart = Provider.of<CartProvider>(context, listen: false);
        cart.removeItem(item);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: Text('${item.price}'),
              ),
            ),
          ),
          title: Text(item.name),
          subtitle: Text('Total: R\$ ${item.price.toStringAsFixed(2)}'),
          trailing: Text('${item.quantity}x'),
        ),
      ),
    );
  }
}
