import 'package:flutter/material.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:iburger/app/pages/order/order_page.dart';
import 'package:provider/provider.dart';

abstract class OrderPageRouter {
  OrderPageRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => Object()),
        ],
        builder: (context, child) {
          final orderArgs = ModalRoute.of(context)?.settings.arguments
              as List<OrderProductDto>;
          return OrderPage(bag: orderArgs);
        },
      );
}
