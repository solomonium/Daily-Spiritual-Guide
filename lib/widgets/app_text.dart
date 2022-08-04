import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  double size;
  FontWeight? fontWeight;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  TextOverflow? overflow;
  TextTheme? textTheme;

  AppText(
      {Key? key,
      this.size = 16,
      this.fontWeight,
      this.textAlign = TextAlign.left,
      required this.text,
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
        fontWeight: fontWeight,
        textStyle: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
