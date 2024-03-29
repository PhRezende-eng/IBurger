import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:iburger/app/core/exception/repository_exception.dart';
import 'package:iburger/app/core/exception/unthorized_exception.dart';
import 'package:iburger/app/core/rest_client/custom_dio.dart';
import 'package:iburger/app/models/auth_model.dart';
import 'package:iburger/app/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({required this.dio});

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final response = await dio.post('/auth', data: {
        'email': email,
        'password': password,
      });
      return AuthModel.fromMap(response.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        const errorMessage = 'Acesso não autorizado';
        log(errorMessage, error: e, stackTrace: s);
        throw UnthorizedExceptions(message: errorMessage);
      }
      const errorMessage = 'Erro ao efutuar login';
      log(errorMessage, error: e, stackTrace: s);
      throw RepositoryException(message: errorMessage);
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unAuth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao registrar usário';
      log(errorMessage, error: e, stackTrace: s);
      throw RepositoryException(message: errorMessage);
    }
  }
}
