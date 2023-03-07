import 'package:flutter/material.dart';
import 'package:iburger/app/pages/product_detail/product_datail_page.dart';
import 'package:provider/provider.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => Object(),
          ),
          Provider.value(value: Object())
        ],
        child: const ProductDetailPage(),
      );
}
