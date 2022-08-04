import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double width;
  double? height;
  // Color color;

  Line({
    Key? key,
    required this.width,
    this.height = 1.0,
    // this.color = AppColors.lineColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: height, width: width, //color: color
      ),
    );
  }
}
