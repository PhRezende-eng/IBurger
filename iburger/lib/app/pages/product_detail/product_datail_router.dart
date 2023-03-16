import 'package:flutter/material.dart';
import 'package:iburger/app/pages/product_detail/product_datail_page.dart';
import 'package:iburger/app/pages/product_detail/product_detail_controller.dart';
import 'package:provider/provider.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailController(),
          ),
          Provider.value(value: Object())
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;

          return ProductDetailPage(
            product: args['product'],
            order: args['order'],
          );
        },
      );
}
