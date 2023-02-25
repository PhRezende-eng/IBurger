import 'package:flutter/material.dart';
import 'package:iburger/app/core/rest_client/custom_dio.dart';
import 'package:iburger/app/pages/home/home_controller.dart';
import 'package:iburger/app/pages/home/home_page.dart';
import 'package:iburger/app/repository/products/products_repository_impl.dart';
import 'package:provider/provider.dart';

abstract class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepositoryImpl>(
            //design partern using instance by dependecy injection
            create: (context) =>
                ProductsRepositoryImpl(context.read<CustomDio>()),
          ),
          Provider<HomeController>(
            create: (context) =>
                HomeController(context.read<ProductsRepositoryImpl>()),
          )
        ],
        child: const HomePage(),
      );
}
