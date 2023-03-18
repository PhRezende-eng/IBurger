import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cadastro',
                style: context.textStyles.textTitle,
              ),
              const SizedBox(height: 8),
              Text(
                'Preencha os campos abaixo para criar o seu cadastro.',
                style: context.textStyles.textMedium.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(labelText: "Nome*"),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(labelText: "E-mail*"),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(labelText: "Senha*"),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Confirmar senha*"),
              ),
              const SizedBox(height: 30),
              DeliveryButton(
                onPressed: () {},
                child: const Text("CADASTRAR"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
