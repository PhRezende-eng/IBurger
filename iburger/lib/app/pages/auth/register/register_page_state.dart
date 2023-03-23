import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
part 'register_page_state.g.dart';

@match
enum RegisterStatus {
  initial,
  loading,
  success,
  error,
}

class RegisterSate extends Equatable {
  final RegisterStatus status;
  const RegisterSate({
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

  @override
  List<Object?> get props => [status];
}
