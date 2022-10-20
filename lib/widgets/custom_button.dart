// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spiritual_daily_guide/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onpressed,
    required this.text,
  }) : super(key: key);

final VoidCallback onpressed;
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: EdgeInsets.only(left: 115, right: 122),
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(text, textAlign: TextAlign.center,
        style: GoogleFonts.nunitoSans(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w900
        ),),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal:50, vertical: 15),
      backgroundColor: MyColors.primaryColor, // background (button) color
   // foregroundColor: Colors.white,
       shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
       )
      
  ),
      ),
    );
  }
}
