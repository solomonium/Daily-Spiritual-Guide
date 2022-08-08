import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  const MyCard(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: RadialGradient(
          colors: [
            Colors.transparent,
            Colors.deepPurpleAccent[400]!.withOpacity(.6),
          ],
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
