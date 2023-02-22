import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        builder: (_) => Platform.isIOS
            ? CupertinoActivityIndicator(
                radius: 30.0,
                color: context.colors.whiteColor,
              )
            : Center(
                child: CircularProgressIndicator(
                  color: context.colors.whiteColor,
                ),
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
