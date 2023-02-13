import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/widgets/snack_bar_message.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      DeliverySnackBar.error(context, message),
    );
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      DeliverySnackBar.success(context, message),
    );

    // showTopSnackBar(
    //   Overlay.of(context)!,
    //   CustomSnackBar.success(message: message),
    // );
  }

  void showInfo(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      DeliverySnackBar.info(context, message),
    );

    // showTopSnackBar(
    //   Overlay.of(context)!,
    //   CustomSnackBar.info(message: message),
    // );
  }
}
