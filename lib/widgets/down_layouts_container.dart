import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'positioning_container.dart';

Widget DownLayoutContainer() {
  return Stack(
    children: [
       PositioningContainer(
              bottom: -90,
              right: -75,
              color: MyColors.color3,
            ),
            PositioningContainer(
              bottom: 60,
              right: -60,
              height: 130,
              width: 158,
              color: MyColors.color2,
            ),
            PositioningContainer(
                bottom: 10,
                right: 30,
                width: 158,
                height: 130,
                color: MyColors.color1),
    ],
  );
}
