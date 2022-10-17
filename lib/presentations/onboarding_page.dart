import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spiritual_daily_guide/route_folder/route_names.dart';
import 'package:spiritual_daily_guide/widgets/app_large_text.dart';
import 'package:spiritual_daily_guide/widgets/app_text.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';

import '../utils/colors.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: PageView(
            controller: controller,
            children: [
              Container(
                child: Stack(children: [
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          child: Container(color: MyColors.backgroundColor),
                        ),
                      ),
                      ClipPath(
                        clipper: CustomClipPart(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.primaryColor,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 550,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 22, right: 22, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 340,
                            width: 330,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(
                              "assets/slide1.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          addVerticalSpace(50),
                          AppLargeText(
                            text: 'Anywhere & Anytime',
                            color: MyColors.backgroundColor,
                          ),
                          addVerticalSpace(37),
                          SizedBox(
                            height: 70,
                            width: 280,
                            child: AppText(
                                text:
                                    'Read and  complete your bible task anywhere and anytime .',
                                color: MyColors.backgroundColor),
                          ),
                          addVerticalSpace(100),
                          SmoothPageIndicator(
                              effect: ExpandingDotsEffect(
                                  dotWidth: 10,
                                  dotHeight: 7,
                                  activeDotColor: MyColors.backgroundColor),
                              controller: controller,
                              count: 3)
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                child: Stack(children: [
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          child: Container(color: MyColors.backgroundColor),
                        ),
                      ),
                      ClipPath(
                        clipper: CustomClipPart(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          width: MediaQuery.of(context).size.width,
                          height: 550,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 22, right: 22, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 340,
                            width: 330,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(
                              "assets/slide2.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          addVerticalSpace(50),
                          AppLargeText(
                            text: 'Audio Feature',
                            color: MyColors.backgroundColor,
                          ),
                          addVerticalSpace(37),
                          SizedBox(
                            height: 70,
                            width: 280,
                            child: AppText(
                                text:
                                    'With our audio feature you can now listen to bible verses.',
                                color: MyColors.backgroundColor),
                          ),
                          addVerticalSpace(100),
                          SmoothPageIndicator(
                              effect: ExpandingDotsEffect(
                                  dotWidth: 10,
                                  dotHeight: 7,
                                  activeDotColor: MyColors.backgroundColor),
                              controller: controller,
                              count: 3)
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                child: Stack(children: [
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          child: Container(color: MyColors.backgroundColor),
                        ),
                      ),
                      ClipPath(
                        clipper: CustomClipPart(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          width: MediaQuery.of(context).size.width,
                          height: 550,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 22, right: 22, top: 50, bottom: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 340,
                            width: 330,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(
                              "assets/slide3.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          addVerticalSpace(50),
                          AppLargeText(
                            text: 'Set Reminder',
                            color: MyColors.backgroundColor,
                          ),
                          addVerticalSpace(37),
                          SizedBox(
                            height: 70,
                            width: 280,
                            child: AppText(
                                text:
                                    'Set a reminder for a particular time to read day and night.',
                                color: MyColors.backgroundColor),
                          ),
                          addVerticalSpace(100),
                          SmoothPageIndicator(
                              effect: ExpandingDotsEffect(
                                  dotWidth: 10,
                                  dotHeight: 7,
                                  activeDotColor: MyColors.backgroundColor),
                              controller: controller,
                              count: 3),
                          // addVerticalSpace(50),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              height: 40,
                              width: 80,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: MyColors.primaryColor),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteName.signInPage);
                                },
                                child: Text('Next'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w, h, w, h / 4);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
