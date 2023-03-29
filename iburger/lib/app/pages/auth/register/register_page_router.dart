import 'package:flutter/material.dart';
import 'package:iburger/app/pages/auth/register/register_page.dart';
import 'package:iburger/app/pages/auth/register/register_page_controller.dart';
import 'package:iburger/app/repository/auth/auth_repository_impl.dart';
import 'package:provider/provider.dart';

class RegisterPageRouter {
  RegisterPageRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) =>
                RegisterPageController(context.read<AuthRepositoryImpl>()),
          ),
        ],
        child: const RegisterPage(),
      );
}
