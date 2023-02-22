import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/helpers/size_extensions.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: ColorsApp.instance.splashBackgroundColor,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: context.percentHeight(0.1)),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 80),
                  DeliveryButton(
                    height: 35,
                    width: context.percentWidth(0.6),
                    label: 'ACESSAR',
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/home');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
