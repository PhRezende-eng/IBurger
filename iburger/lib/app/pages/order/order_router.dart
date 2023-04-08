import 'package:flutter/material.dart';
import 'package:iburger/app/core/rest_client/custom_dio.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:iburger/app/pages/order/order__controller.dart';
import 'package:iburger/app/pages/order/order_page.dart';
import 'package:iburger/app/repository/order/order_repository_impl.dart';
import 'package:provider/provider.dart';

abstract class OrderPageRouter {
  OrderPageRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
              create: (context) =>
                  OrderRepositoryImpl(context.read<CustomDio>())),
          Provider(
              create: (context) =>
                  OrderController(context.read<OrderRepositoryImpl>())),
        ],
        builder: (context, child) {
          final orderArgs = ModalRoute.of(context)?.settings.arguments
              as List<OrderProductDto>;
          return OrderPage(bag: orderArgs);
        },
      );
}
