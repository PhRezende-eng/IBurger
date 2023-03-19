import 'package:match/match.dart';
part 'register_page_state.g.dart';

@match
enum RegisterStatus {
  initial,
  loading,
  success,
  error,
}

class RegisterSate {
  final RegisterStatus status;
  RegisterSate({
    required this.status,
  });

  const RegisterSate.initial() : status = RegisterStatus.initial;

  RegisterSate copyWith({
    RegisterStatus? status,
  }) {
    return RegisterSate(
      status: status ?? this.status,
    );
  }
}
