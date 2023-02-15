import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iburger/app/core/ui/theme/theme_config.dart';
import 'package:iburger/app/pages/splash/splash_page.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConfig.theme,
      title: 'Delivery App',
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
