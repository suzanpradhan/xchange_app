import 'package:flutter/material.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final bool isfocus;
  final double width;
  final bool readOnly;
  final TextEditingController textEditingController;
  CustomTextField(
      {this.hintText,
      this.readOnly,
      this.obscureText,
      this.isfocus,
      this.textInputAction,
      this.width,
      this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      width: width,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorsPalette.blackGrey),
          color: ColorsPalette.white,
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
          readOnly: readOnly == null ? false : readOnly,
          controller: textEditingController,
          textInputAction: textInputAction,
          obscureText: obscureText,
          cursorColor: ColorsPalette.accentRed,
          style: Typograph.bodyTextBlack,
          onSubmitted: (_) => isfocus
              ? FocusScope.of(context).requestFocus()
              : FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: Typograph.bodyTextGrey)),
    );
  }
}
