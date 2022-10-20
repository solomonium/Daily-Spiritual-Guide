// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class PositioningContainer extends StatelessWidget {
  const PositioningContainer({
    Key? key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.sigmaX = 148,
    this.sigmaY = 158,
    required this.color,
   this.height = 200,
   this.width = 200,
  }) : super(key: key);
  final double? height;
  final double? width;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double sigmaX;
  final double sigmaY;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: width,
        height: height,
        color: color,
        // child: Container(
        //   height: 147,
        //   width: 158,
        //   //  color: Colors.transparent,
        // ),
      ),
    );
  }
}
