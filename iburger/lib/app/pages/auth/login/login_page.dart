import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iburger/app/core/ui/base_state/base_state.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';
import 'package:iburger/app/pages/auth/login/login_page_controller.dart';
import 'package:iburger/app/pages/auth/login/login_page_state.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final passNotifier = ValueNotifier<bool>(true);
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocListener<LoginController, LoginState>(
        listener: (context, state) => state.status.matchAny(
          any: () => hideLoader(),
          login: () => showLoader('Logando usuário...'),
          success: () {
            hideLoader();
            showSuccess("Bem vindo!");
            Navigator.of(context).pop(true);
          },
          loginError: () {
            hideLoader();
            showError(state.errorMessage!);
          },
          errorUnthorized: () {
            hideLoader();
            showError(state.errorMessage!);
          },
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: context.textStyles.textTitle,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: emailEC,
                        decoration: const InputDecoration(labelText: "E-mail"),
                        validator: Validatorless.multiple([
                          Validatorless.required("E-mail é obrigatório"),
                          Validatorless.email("E-mail inválido"),
                        ]),
                      ),
                      const SizedBox(height: 30),
                      ValueListenableBuilder(
                        valueListenable: passNotifier,
                        builder: (context, value, __) => TextFormField(
                          controller: passEC,
                          obscureText: value,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            suffix: GestureDetector(
                              onTap: () {
                                passNotifier.value = !value;
                              },
                              child: Icon(
                                value
                                    ? Icons.lock_outline
                                    : Icons.lock_open_rounded,
                              ),
                            ),
                          ),
                          validator:
                              Validatorless.required("Senha é obrigatório"),
                        ),
                      ),
                      const SizedBox(height: 50),
                      DeliveryButton(
                        onPressed: () {
                          final valid =
                              formKey.currentState?.validate() ?? false;
                          if (valid) {
                            controller.login(emailEC.text, passEC.text);
                          }
                        },
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
                      onPressed: () {
                        Navigator.of(context).pushNamed('/auth/register');
                      },
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
      ),
    );
  }
}
