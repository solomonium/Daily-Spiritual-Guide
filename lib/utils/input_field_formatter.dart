import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/utils/app_styles.dart';
// import 'package:render_seeker_app/export.dart';

InputDecoration standardTextFieldDecoration(
    {String labelText = '',
    String hintText = '',
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? textColor,
    bool fillBackgroundWithColor = false,
    double borderRadius = 8,
    Color? fillColor}) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: fillBackgroundWithColor,
    fillColor: fillColor ?? const Color(0xfff6f7fa),
    hintStyle: TextStyles.body1
        .copyWith(color: textColor ?? Colors.grey[600], fontSize: 16),
    labelStyle: TextStyles.body1
        .copyWith(color: textColor, fontWeight: FontWeight.w400),
    focusColor: const Color(0xFFE2E3E4),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  );
}

Container textFieldWrapper(
    {required Widget child, double fieldHeight = 53.0, Color? fillColor}) {
  return Container(
    height: fieldHeight,
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.only(top: 8, bottom: 5, left: 5, right: 5),
    decoration: BoxDecoration(
      color: fillColor ?? const Color(0xfff6f7fa),
      borderRadius: BorderRadius.circular(8),
    ),
    child: child,
  );
}

phoneFieldMaterialWrapper({required Widget child}) {
  return Material(
      color: const Color(0xfff6f7fa),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: child,
      ));
}

class RenndaarCustomTextField extends StatefulWidget {
  const RenndaarCustomTextField({
    Key? key,
    this.fillColor,
    this.fieldHeight = 53,
    this.fieldInitialValue,
    this.fieldControllerText,
    this.suffixIcon,
    this.label,
    required this.onFieldChange,
  }) : super(key: key);
  final double fieldHeight;
  final Color? fillColor;
  final String? fieldInitialValue;
  final TextEditingController? fieldControllerText;
  final Widget? suffixIcon;
  final Function onFieldChange;
  final String? label;
  @override
  State<RenndaarCustomTextField> createState() =>
      _RenndaarCustomTextFieldState();
}

class _RenndaarCustomTextFieldState extends State<RenndaarCustomTextField> {
  late FocusNode firstField;

  @override
  void initState() {
    super.initState();
    firstField = FocusNode();

    if (widget.fieldControllerText == null) {
      print('add a controller to the first combined field');
      null; //check if null if null then do nothing
    } else {
      //add listener if not null
      widget.fieldControllerText?.addListener(_returnFirstFieldControllerText);
    }
  }

  @override
  void dispose() {
    firstField.dispose();

    ///for textEditing Controllers
    widget.fieldControllerText?.dispose();

    super.dispose();
  }

  void _returnFirstFieldControllerText(
      {String? value, bool useController = true}) {
    if (useController) {
      widget.onFieldChange(widget.fieldControllerText?.text);
    } else {
      widget.onFieldChange(value);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.fieldHeight,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 8, bottom: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        color: widget.fillColor ?? const Color(0xfff6f7fa),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        focusNode: firstField,
        controller: widget.fieldInitialValue == null
            ? widget.fieldControllerText
            : null,
        decoration: standardTextFieldDecoration(
            fillBackgroundWithColor: true,
            labelText: widget.label ?? 'Enter Label Text',
            suffixIcon: widget.suffixIcon ?? const SizedBox.shrink()),
        onFieldSubmitted: (term) {
          firstField.unfocus();
        },
        onChanged: (va) {
          _returnFirstFieldControllerText(value: va, useController: false);
        },
      ),
    );
  }
}
