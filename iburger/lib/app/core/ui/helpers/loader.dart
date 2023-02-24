import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader(String loadingTitle) {
    Color textColor = context.colors.whiteColor.withOpacity(0.8);
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (_) => SimpleDialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: max(50, 110 - loadingTitle.length.toDouble()),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: context.colors.blackColor,
          children: [
            const SizedBox(height: 26),
            CupertinoActivityIndicator(
              radius: 18.0,
              color: textColor,
            ),
            const SizedBox(height: 16),
            Text(
              loadingTitle,
              textAlign: TextAlign.center,
              style: context.textStyles.textMedium.copyWith(
                fontSize: 18,
                color: textColor,
              ),
            ),
            const SizedBox(height: 26),
          ],
        ),
      );

      // showDialog(
      //   context: context,
      //   builder: (_) => LoadingAnimationWidget.threeArchedCircle(
      //     color: context.colors.primary,
      //     size: 60,
      //   ),
      // );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
