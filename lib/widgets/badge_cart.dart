import 'package:flutter/material.dart';

class BadgeCart extends StatelessWidget {
  final int value;
  final Color? color;
  final Widget child;

  const BadgeCart({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        child,
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 16.0,
              minHeight: 16.0,
            ),
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                value.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
