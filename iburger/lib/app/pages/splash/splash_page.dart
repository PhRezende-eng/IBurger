import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Column(
        children: [
          DeliveryButton(
            label: 'Teste',
            onPressed: () {},
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Text'),
          ),
        ],
      ),
    );
  }
}
