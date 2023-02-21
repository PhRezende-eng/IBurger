import 'dart:js';

import 'package:flutter/material.dart';
import 'package:iburger/app/core/rest_client/custom_dio.dart';
import 'package:iburger/app/pages/home/home_page.dart';
import 'package:iburger/app/repository/products/products_repository_impl.dart';
import 'package:provider/provider.dart';

abstract class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepositoryImpl>(
            create: (context) =>
                ProductsRepositoryImpl(context.read<CustomDio>()),
          )
        ],
        child: const HomePage(),
      );
}
