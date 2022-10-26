import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:spiritual_daily_guide/utils/app_styles.dart';
import 'package:spiritual_daily_guide/utils/input_field_formatter.dart';
import 'package:spiritual_daily_guide/extentions/size.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';
// import 'package:render_seeker_app/export.dart';

class CustomCombinedTextFormWithDropDown extends StatefulWidget {
  const CustomCombinedTextFormWithDropDown({
    Key? key,
    this.firstFieldControllerText,
    this.secondFieldControllerText,
    this.firstFieldInitialValue,
    this.secondFieldInitialValue,
    required this.onFirstFieldChange,
    required this.onSecondFieldChange,
    this.fillColor,
    this.firstSuffixIcon,
    this.itemList = const ['Project', "3 Project"],
  }) : super(key: key);
  final TextEditingController? firstFieldControllerText;
  final TextEditingController? secondFieldControllerText;
  final String? firstFieldInitialValue;
  final String? secondFieldInitialValue;
  final Function onFirstFieldChange;
  final Function onSecondFieldChange;
  final Widget? firstSuffixIcon;
  final Color? fillColor;
  final List<String> itemList;
  @override
  State<CustomCombinedTextFormWithDropDown> createState() =>
      _CustomCombinedTextFormWithDropDownState();
}

class _CustomCombinedTextFormWithDropDownState
    extends State<CustomCombinedTextFormWithDropDown> {
  late FocusNode firstField;
  @override
  void initState() {
    super.initState();
    firstField = FocusNode();

    if (widget.firstFieldControllerText == null) {
      log('add a controller to the first combined field');
      null; //check if null if null then do nothing
    } else {
      //add listener if not null
      widget.firstFieldControllerText
          ?.addListener(_returnFirstFieldControllerText);
    }
    if (widget.secondFieldControllerText == null) {
      log('add a controller to this second combine field');
      //check if null if null then do nothing
    } else {
      //add listener if not null
      widget.secondFieldControllerText
          ?.addListener(_returnSecondFieldControllerText);
    }

    dropDownValue = widget.itemList[0];
  }

  @override
  void dispose() {
    firstField.dispose();

    ///for textEditing Controllers
    widget.firstFieldControllerText?.dispose();
    widget.secondFieldControllerText?.dispose();
    super.dispose();
  }

  void _returnFirstFieldControllerText(
      {String? value, bool useController = true}) {
    // print(widget.firstFieldControllerText?.text);
    // print("widget.firstFieldControllerText?.text");
    if (useController) {
      widget.onFirstFieldChange(widget.firstFieldControllerText?.text);
    } else {
      widget.onFirstFieldChange(value);
    }

    setState(() {});
  }

  void _returnSecondFieldControllerText({String? value}) {
    widget.onSecondFieldChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: context.widthPx,
        height: 100,
        child: Row(
          children: [
            Container(
              width: context.widthPx * 0.49,
              height: 65,
              decoration: BoxDecoration(
                  color: widget.fillColor ?? const Color(0xfff6f7fa),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  focusNode: firstField,
                  controller: widget.firstFieldInitialValue == null
                      ? widget.firstFieldControllerText
                      : null,
                  decoration: standardTextFieldDecoration(
                      fillBackgroundWithColor: true,
                      labelText: 'Amount',
                      suffixIcon:
                          widget.firstSuffixIcon ?? const SizedBox.shrink()),
                  onFieldSubmitted: (term) {
                    firstField.unfocus();
                  },
                  onChanged: (va) {
                    _returnFirstFieldControllerText(
                        value: va, useController: false);
                  },
                ),
              ),
            ),
            addVerticalSpace(15),
            Container(
              width: context.widthPx * 0.49,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                  color: widget.fillColor ?? const Color(0xfff6f7fa),
                  borderRadius: BorderRadius.circular(8)),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -6,
                    child: Text('Per',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ),
                  DropdownButton(
                    underline: const SizedBox.shrink(),
                    style: TextStyles.body1.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff23262B)),
                    isExpanded: true,
                    icon: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Icon(
                        FeatherIcons.chevronDown,
                      ),
                    ),
                    value: dropDownValue,
                    items: widget.itemList
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (String? selectedValue) {
                      dropDownValue = selectedValue.toString();
                      _returnSecondFieldControllerText(
                        value: selectedValue.toString(),
                      );
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  late String dropDownValue;
}

class CustomCombinedTextForm extends StatefulWidget {
  const CustomCombinedTextForm({
    Key? key,
    required this.firstFieldControllerText,
    this.secondFieldControllerText,
    this.firstFieldInitialValue,
    this.secondFieldInitialValue,
    required this.onFirstFieldChange,
    required this.onSecondFieldChange,
    this.firstSuffixIcon,
  }) : super(key: key);
  final TextEditingController? firstFieldControllerText;
  final TextEditingController? secondFieldControllerText;
  final String? firstFieldInitialValue;
  final String? secondFieldInitialValue;
  final Function onFirstFieldChange;
  final Function onSecondFieldChange;
  final Widget? firstSuffixIcon;
  @override
  State<CustomCombinedTextForm> createState() => _CustomCombinedTextFormState();
}

class _CustomCombinedTextFormState extends State<CustomCombinedTextForm> {
  late FocusNode firstField;
  late FocusNode secondField;
  @override
  void initState() {
    super.initState();
    firstField = FocusNode();

    if (widget.firstFieldControllerText == null) {
      log('add a controller to the first combined field');
      null; //check if null if null then do nothing
    } else {
      //add listener if not null
      widget.firstFieldControllerText
          ?.addListener(_returnFirstFieldControllerText);
    }
    if (widget.secondFieldControllerText == null) {
      log('add a controller to this second combine field');
      //check if null if null then do nothing
    } else {
      //add listener if not null
      widget.secondFieldControllerText
          ?.addListener(_returnSecondFieldControllerText);
    }
  }

  @override
  void dispose() {
    firstField.dispose();
    // secondField.dispose();

    ///for textEditing Controllers
    widget.firstFieldControllerText?.dispose();
    widget.secondFieldControllerText?.dispose();
    super.dispose();
  }

  void _returnFirstFieldControllerText(
      {String? value, bool useController = true}) {
    if (useController) {
      widget.onFirstFieldChange(widget.firstFieldControllerText?.text);
    } else {
      widget.onFirstFieldChange(value);
    }

    // setState(() {});
  }

  void _returnSecondFieldControllerText(
      {String? value, bool useController = true}) {
    if (useController) {
      widget.onSecondFieldChange(widget.secondFieldControllerText?.text);
    } else {
      widget.onSecondFieldChange(value);
    }

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: context.widthPx,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              width: context.widthPx * 0.5,
              // height: 150,
              child: TextFormField(
                focusNode: firstField,
                controller: widget.firstFieldInitialValue == null
                    ? widget.firstFieldControllerText
                    : null,
                decoration: standardTextFieldDecoration(
                    fillBackgroundWithColor: true,
                    labelText: 'amount',
                    suffixIcon:
                        widget.firstSuffixIcon ?? const SizedBox.shrink()),
                onFieldSubmitted: (term) {
                  firstField.unfocus();
                  FocusScope.of(context).requestFocus(secondField);
                },
                onChanged: (va) {
                  // _returnFirstControllerText(value: va, useController: false);
                  _returnFirstFieldControllerText(
                      value: va, useController: false);
                },
              ),
            ),
            SizedBox(
              width: context.widthPx * 0.5,
              // height: 150,
              child: TextFormField(
                focusNode: secondField,
                controller: widget.secondFieldInitialValue == null
                    ? widget.secondFieldControllerText
                    : null,
                decoration: standardTextFieldDecoration(
                  fillBackgroundWithColor: true,
                  labelText: 'Price',
                ),
                onFieldSubmitted: (term) {
                  secondField.unfocus();
                },
                onChanged: (va) {
                  if (va.isEmpty) {
                    _returnSecondFieldControllerText(
                        value: va, useController: false);
                    secondField.unfocus();
                    FocusScope.of(context).requestFocus(firstField);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String dropDownValue = '5 minutes before';
  List<String> alertPeriod = [
    '5 minutes before',
    '10 minutes before',
    '15 minutes before',
    '30 minutes before',
    '1 hour before',
    '2 hours before',
  ];
}
