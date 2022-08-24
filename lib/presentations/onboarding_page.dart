import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spiritual_daily_guide/utils/colors.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          children: [
            Container(
              color: MyColors.backgroundColor,
              child: Stack(children: [
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: MyColors.primaryColor),
                //     height: MediaQuery.of(context).size.height * 0.5,
                //   ),
                // )
              ]),
            ),
            Container(
              color: Colors.amber,
              child: Center(
                child: Text('Page 2'),
              ),
            ),
            Container(
              color: Colors.purple,
              child: Center(
                child: Text('Page 3'),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
          color: MyColors.primaryColor,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Positioned(
            bottom: 100,
            // alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text('SKIP')),
                Center(
                    child: SmoothPageIndicator(
                  effect: WormEffect(
                      spacing: 16,
                      dotColor: MyColors.backgroundColor,
                      activeDotColor: Colors.black),
                  controller: controller,
                  count: 3,
                )),
                TextButton(onPressed: () {}, child: Text('NEXT'))
              ],
            ),
          )),
    );
  }
}
