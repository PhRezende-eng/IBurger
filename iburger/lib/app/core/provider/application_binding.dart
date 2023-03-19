import 'package:flutter/material.dart';
import 'package:iburger/app/core/rest_client/custom_dio.dart';
import 'package:iburger/app/repository/ayth/auth_repository.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //design partern creating singleton for dependecy ejection
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider<AuthRepositoryImpl>(
          create: (context) =>
              AuthRepositoryImpl(dio: context.read<CustomDio>()),
        )
      ],
      child: child,
    );
  }
}
