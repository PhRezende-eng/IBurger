import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';

class OrderField extends StatelessWidget {
  final String title, hintText;
  final TextEditingController controller;
  final String? Function(dynamic) validatorless;
  const OrderField(
      {required this.controller,
      required this.title,
      required this.hintText,
      required this.validatorless,
      super.key});

  @override
  Widget build(BuildContext context) {
    final inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: context.colors.borderSideButton),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            title,
            style: context.textStyles.textRegular.copyWith(
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: validatorless,
          decoration: InputDecoration(
            border: inputBorder,
            enabledBorder: inputBorder,
            errorBorder: inputBorder,
            focusedBorder: inputBorder,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
