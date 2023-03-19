import 'package:iburger/app/models/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> login(String email, String password);
  Future<void> register(String name, String email, String password);
}
