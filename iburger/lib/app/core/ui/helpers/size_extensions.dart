import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double percentWidth(double percent) =>
      MediaQuery.of(this).size.width * percent;

  double percentHeight(double percent) =>
      MediaQuery.of(this).size.height * percent;
}
