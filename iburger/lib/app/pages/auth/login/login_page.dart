import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: context.textStyles.textTitle,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                        decoration: const InputDecoration(labelText: "E-mail")),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Senha"),
                    ),
                    const SizedBox(height: 50),
                    DeliveryButton(
                      onPressed: () {},
                      child: const Text("ENTRAR"),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Não possui conta?",
                    style: context.textStyles.textBold,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cadastre-se",
                      style: context.textStyles.textBold
                          .copyWith(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
