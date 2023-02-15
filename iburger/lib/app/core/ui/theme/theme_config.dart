import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/app_styles.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _deafaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      color: ColorsApp.instance.borderSideButton,
    ),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.instance.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.instance.whiteColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsApp.instance.blackColor),
    ),
    primaryColor: ColorsApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.instance.primaryButton),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorsApp.instance.whiteColor,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _deafaultInputBorder,
      enabledBorder: _deafaultInputBorder,
      focusedBorder: _deafaultInputBorder,
      labelStyle: TextStyles.instance.textRegular
          .copyWith(color: ColorsApp.instance.blackColor),
      errorStyle: TextStyles.instance.textRegular
          .copyWith(color: ColorsApp.instance.errorColor),
    ),
  );
}
