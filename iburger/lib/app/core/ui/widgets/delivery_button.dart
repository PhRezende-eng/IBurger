import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? color;
  final double? height;
  final double? width;

  const DeliveryButton({
    required this.onPressed,
    required this.child,
    this.color,
    this.height = 56,
    this.width = double.infinity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
