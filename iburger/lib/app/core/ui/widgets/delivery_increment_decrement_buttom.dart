import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';

class DeliveryIncrementDecrementButtom extends StatelessWidget {
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const DeliveryIncrementDecrementButtom({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.borderSideButton),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: decrementTap,
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(22),
            ),
            icon: Icon(
              Icons.remove,
              color: context.colors.borderSideButton,
            ),
          ),
          Text(
            "$amount",
            style: context.textStyles.textRegular
                .copyWith(fontSize: 18, color: context.colors.secondary),
          ),
          IconButton(
            onPressed: incrementTap,
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(22),
            ),
            icon: Icon(
              Icons.add,
              color: context.colors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
