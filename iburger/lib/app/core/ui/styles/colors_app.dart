import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    if (_instance == null) {
      _instance = ColorsApp._();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  Color get primary => const Color(0XFF007D21);
  Color get secondary => const Color(0XFFF88B0C);
  Color get borderSideButton => Colors.grey[400]!;
  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;
  Color get errorColor => Colors.red;
}

extension T on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
