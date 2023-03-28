import 'package:flutter/material.dart';
import 'package:iburger/app/core/extensions/formatter_extension.dart';
import 'package:iburger/app/core/ui/helpers/size_extensions.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;
  const ShoppingBagWidget({super.key, required this.bag});

  @override
  Widget build(BuildContext context) {
    //Reduce
    var totalPrice = bag.fold(
      0.0,
      (previousValue, element) => previousValue + element.totalPrice,
    );

    return Container(
      width: context.screenWidth,
      height: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        boxShadow: [BoxShadow(color: context.colors.shadow, blurRadius: 8)],
      ),
      child: ElevatedButton(
        onPressed: () {
          _sendToOrder(context);
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Ver sacola",
                style: context.textStyles.textExtraBold,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalPrice.currencyPTBR,
                style: context.textStyles.textExtraBold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _sendToOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();

    if (!sp.containsKey("accessToken")) {
      final userAuth = await navigator.pushNamed('/auth/login');
      if (userAuth == null || userAuth == false) return;
    }

    final result = await navigator.pushNamed('/order', arguments: bag);
  }
}
