import 'package:flutter/material.dart';
import 'package:iburger/app/core/rest_client/custom_dio.dart';
import 'package:iburger/app/pages/auth/login/login_page.dart';
import 'package:iburger/app/pages/auth/login/login_page_controller.dart';
import 'package:iburger/app/repository/auth/auth_repository_impl.dart';
import 'package:provider/provider.dart';

abstract class LoginPageRouter {
  LoginPageRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<AuthRepositoryImpl>(
            create: (context) =>
                AuthRepositoryImpl(dio: context.read<CustomDio>()),
          ),
          Provider(
            create: (context) =>
                LoginController(context.read<AuthRepositoryImpl>()),
          ),
        ],
        child: const LoginPage(),
      );
}
