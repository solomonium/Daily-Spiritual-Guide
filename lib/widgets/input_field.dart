import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spiritual_daily_guide/widgets/app_text.dart';

import 'helper_tools.dart';

class InputFieldWidget extends StatelessWidget {
  Icon? icon;
  final TextInputType textInputType;
  final String labelText;
  final TextEditingController textController;
  final bool autoFocus;
  final String? Function(String?)? validate;
  bool isPassword;
  String? hintText;
  final TextInputAction textInputAction;

  InputFieldWidget(
      {Key? key,
      this.icon,
      this.isPassword = false,
      required this.textInputType,
      required this.labelText,
      required this.textController,
      required this.autoFocus,
      this.validate,
      this.hintText,
      required this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: labelText,
            color: Colors.white,
          ),
          addVerticalSpace(12),
          SizedBox(
            height: 52,
            child: TextFormField(
              controller: textController,
              validator: validate,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                    // fontSize: 0,
                    //   color: Colors.transparent,
                    height: 0.7),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      // color: AppColors.bannerTextColor, width: 0.9
                      ),
                  borderRadius: BorderRadius.circular(11),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        // color: AppColors.borderColor, width: 0.9
                        ),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        // color: AppColors.borderColor, width: 0.9
                        ),
                    borderRadius: BorderRadius.circular(12)),
                filled: true,
                hintText: hintText,
                hintStyle: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  height: 1,
                  // color: AppColors.hintTextColor,
                ),
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
