import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Env? _instance;
  Env._();

  static Env get instance {
    if (_instance == null) {
      _instance = Env._();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  Future<void> get load async => await dotenv.load(fileName: ".env");

  String? operator [](String key) => dotenv.env[key];
}
