import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:iburger/app/core/exception/repository_exception.dart';
import 'package:iburger/app/core/exception/unthorized_exception.dart';
import 'package:iburger/app/pages/auth/login/login_page_state.dart';
import 'package:iburger/app/repository/ayth/auth_repository_impl.dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', authModel.accessToken);
      sp.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnthorizedExceptions catch (e, s) {
      log(e.message, stackTrace: s, error: e);
      emit(state.copyWith(
          status: LoginStatus.errorUnthorized, errorMessage: e.message));
    } on RepositoryException catch (e, s) {
      log(e.message, stackTrace: s, error: e);
      emit(state.copyWith(
          status: LoginStatus.loginError, errorMessage: e.message));
    }
  }
}
