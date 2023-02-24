import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';

class DeliverySnackBar extends SnackBar {
  final BuildContext context;
  final String message;

  DeliverySnackBar.error(
    this.context,
    this.message, {
    super.key,
  }) : super(
          margin: EdgeInsets.only(
            bottom: context.size!.height * 0.74,
            left: 24,
            right: 25,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 16,
          dismissDirection: DismissDirection.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: context.colors.errorColor,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: context.colors.whiteColor,
                size: 32,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  message,
                  style: context.textStyles.textMedium.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        );

  DeliverySnackBar.success(
    this.context,
    this.message, {
    super.key,
  }) : super(
          margin: EdgeInsets.only(
            bottom: context.size!.height * 0.74,
            left: 24,
            right: 25,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 16,
          dismissDirection: DismissDirection.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: context.colors.successColor,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                color: context.colors.whiteColor,
                size: 32,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  message,
                  style: context.textStyles.textMedium.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        );

  DeliverySnackBar.info(
    this.context,
    this.message, {
    super.key,
  }) : super(
          margin: EdgeInsets.only(
            bottom: context.size!.height * 0.74,
            left: 24,
            right: 25,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 16,
          dismissDirection: DismissDirection.none,
          behavior: SnackBarBehavior.floating,
          backgroundColor: context.colors.warningColor,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_outlined,
                color: context.colors.whiteColor,
                size: 32,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  message,
                  style: context.textStyles.textMedium.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        );
}
