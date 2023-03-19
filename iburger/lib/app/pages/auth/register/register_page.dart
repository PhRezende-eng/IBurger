import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iburger/app/core/ui/base_state/base_state.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';
import 'package:iburger/app/pages/auth/register/register_page_controller.dart';
import 'package:iburger/app/pages/auth/register/register_page_state.dart';
import 'package:validatorless/validatorless.dart';

enum TypePass {
  confirmPass,
  pass,
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends BaseState<RegisterPage, RegisterPageController> {
  final ValueNotifier _passwordNotifier = ValueNotifier(true);
  final ValueNotifier _confirmPassNotifier = ValueNotifier(true);

  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passEC = TextEditingController();
  final _confirmPassEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passEC.dispose();
    _confirmPassEC.dispose();
    _nameEC.dispose();
    _passwordNotifier.dispose();
    _confirmPassNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterPageController, RegisterSate>(
      listener: (context, state) {
        state.status.matchAny(
          any: () {
            hideLoader();
          },
          loading: () {
            showLoader("Cadastrando usuário");
          },
          error: () {
            hideLoader();
            showError("Erro ao registrar usuário");
          },
          success: () {
            hideLoader();
            showSuccess("Cadastro realizado com sucesso");
            Navigator.of(context).pop();
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
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
                    controller: _nameEC,
                    validator: Validatorless.required("Nome é obrigatório"),
                    decoration: const InputDecoration(labelText: "Nome*"),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required("Email é obrigatório"),
                      Validatorless.email("Digite um email válido"),
                    ]),
                    decoration: const InputDecoration(labelText: "E-mail*"),
                  ),
                  const SizedBox(height: 30),
                  ValueListenableBuilder(
                    valueListenable: _passwordNotifier,
                    builder: (context, value, __) => TextFormField(
                      controller: _passEC,
                      obscureText: value,
                      validator: Validatorless.multiple([
                        Validatorless.required("Senha é obrigatório"),
                        Validatorless.min(6, "Senha muito pequena"),
                      ]),
                      decoration: InputDecoration(
                        labelText: "Senha*",
                        suffix: GestureDetector(
                          onTap: () {
                            _passwordNotifier.value = !value;
                          },
                          child: Icon(
                            value
                                ? Icons.lock_outline
                                : Icons.lock_open_rounded,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ValueListenableBuilder(
                    valueListenable: _confirmPassNotifier,
                    builder: (context, value, __) => TextFormField(
                      controller: _confirmPassEC,
                      obscureText: value,
                      validator: Validatorless.multiple([
                        Validatorless.required("Confirmar senha é obrigatório"),
                        Validatorless.compare(
                            _passEC, "Senha diferente de confirmar senha"),
                      ]),
                      decoration: InputDecoration(
                        labelText: "Confirmar senha*",
                        suffix: GestureDetector(
                          onTap: () {
                            _confirmPassNotifier.value = !value;
                          },
                          child: Icon(
                            value
                                ? Icons.lock_outline
                                : Icons.lock_open_rounded,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  DeliveryButton(
                    onPressed: () {
                      final valid = _formKey.currentState?.validate() ?? false;
                      if (valid) {
                        controller.register(
                            _nameEC.text, _emailEC.text, _passEC.text);
                      }
                    },
                    child: const Text("CADASTRAR"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
