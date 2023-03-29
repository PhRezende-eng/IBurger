import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:iburger/app/core/exception/repository_exception.dart';
import 'package:iburger/app/pages/auth/register/register_page_state.dart';
import 'package:iburger/app/repository/auth/auth_repository.dart';

class RegisterPageController extends Cubit<RegisterSate> {
  final AuthRepository _authRepository;
  RegisterPageController(this._authRepository)
      : super(const RegisterSate.initial());

  Future<void> register(String name, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStatus.loading));
      await _authRepository.register(email, email, password);
      emit(state.copyWith(status: RegisterStatus.success));
    } on RepositoryException catch (e, s) {
      log(e.message, error: e, stackTrace: s);
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
