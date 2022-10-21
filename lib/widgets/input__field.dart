// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.textController,
    this.keyboardType,
    this.labelText,
    this.textInputAction,
    this.focusNode,
    this.fontSize = 20,
    this.color = MyColors.primaryColor,
    this.suffixIcon,
    required this.obscure,
    this.hinttext,
    required this.onChanged,
    required this.onEditingComplete,
    this.errorText,
    this.validator
  }) : super(key: key);

  final TextEditingController textController;
  final TextInputType? keyboardType;
  final String? labelText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final double fontSize;
  final Color? color;
  final Widget? suffixIcon;
  final bool obscure;
  final String? hinttext;
  final Function(String) onChanged;
  final VoidCallback onEditingComplete;
  final String? errorText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: validator,
          onChanged: onChanged,
          // textAlign: TextAlign.end,
          onEditingComplete: onEditingComplete,
          textAlignVertical: TextAlignVertical(y: -0.0),
          obscureText: obscure,
          focusNode: focusNode,
          textInputAction: textInputAction,
          controller: textController,
          keyboardType: keyboardType,
          autocorrect: false,

          decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: fontSize, color: color),
            labelText: labelText,
            hintText: hinttext,
            errorText: errorText,
            //  contentPadding: EdgeInsets.only(bottom: 50),
            // isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.primaryColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.primaryColor)),
            suffixIcon: suffixIcon,
            suffixIconColor: MyColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
