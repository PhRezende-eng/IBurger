import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
part 'login_page_state.g.dart';

@match
enum LoginStatus {
  initial,
  loading,
  login,
  success,
  errorUnthorized,
  loginError,
}

class LoginState extends Equatable {
  final String? errorMessage;
  final LoginStatus status;
  const LoginState({
    this.errorMessage,
    required this.status,
  });

  const LoginState.initial()
      : errorMessage = null,
        status = LoginStatus.initial;

  LoginState copyWith({
    String? errorMessage,
    LoginStatus? status,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
