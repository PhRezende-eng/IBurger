import 'package:flutter/material.dart';
import 'package:iburger/app/core/provider/application_binding.dart';
import 'package:iburger/app/core/ui/theme/theme_config.dart';
import 'package:iburger/app/pages/auth/login/login_page.dart';
import 'package:iburger/app/pages/home/home_router.dart';
import 'package:iburger/app/pages/product_detail/product_datail_router.dart';
import 'package:iburger/app/pages/splash/splash_page.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        theme: ThemeConfig.theme,
        title: 'Delivery App',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => const LoginPage(),
        },
      ),
    );
  }
}
