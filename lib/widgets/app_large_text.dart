import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  TextTheme? textTheme;
  TextOverflow? overflow;

  AppLargeText(
      {Key? key,
      this.size = 30,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textTheme,
      this.overflow,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.nunitoSans(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        textStyle: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
