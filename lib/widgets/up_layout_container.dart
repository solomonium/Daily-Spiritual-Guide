import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/utils/colors.dart';
import 'package:spiritual_daily_guide/widgets/positioning_container.dart';

Widget UpLayoutContainer() {
  return Stack(
    children: [
      PositioningContainer(
        top: -70,
        left: -70,
        color: MyColors.color1,
        width: 250,
        height: 250,
      ),
      PositioningContainer(
        top: -90,
        left: 50,
        height: 220,
        width: 220,
        color: MyColors.color2,
      ),
      PositioningContainer(
          top: 50, left: 30, width: 200, height: 200, color: MyColors.color3),
    ],
  );
}