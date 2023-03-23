import 'package:flutter/material.dart';
import 'package:iburger/app/pages/auth/login/login_page.dart';
import 'package:iburger/app/pages/auth/login/login_page_controller.dart';
import 'package:iburger/app/repository/ayth/auth_repository.dart';
import 'package:provider/provider.dart';

abstract class LoginPageRouter {
  LoginPageRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) =>
                LoginController(context.read<AuthRepositoryImpl>()),
          ),
        ],
        child: const LoginPage(),
      );
}
