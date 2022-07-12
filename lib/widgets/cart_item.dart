import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_model.dart';

class CartItem extends StatelessWidget {
  final CartModel item;

  const CartItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
