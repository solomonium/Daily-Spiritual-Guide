import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spiritual_daily_guide/data/onboarding_info.dart';
import 'package:spiritual_daily_guide/widgets/app_large_text.dart';
import 'package:spiritual_daily_guide/widgets/app_text.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';

import '../route_folder/route_names.dart';
import '../utils/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  final OnboardingInfo _onboardingInfo = OnboardingInfo();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Container(color: MyColors.backgroundColor),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  _onboardingInfo.selectedPage = index;
                });
              },
              itemCount: _onboardingInfo.getDetailsLength(),
              itemBuilder: ((context, index) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 10,
                      // ),
                      SafeArea(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 0, right: 25, left: 25, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  controller.previousPage(
                                      duration: Duration(microseconds: 3000),
                                      curve: Curves.ease);
                                },
                                child: AppLargeText(
                                  text: 'Back',
                                  color: MyColors.primaryColor,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.nextPage(
                                      duration: Duration(microseconds: 3000),
                                      curve: Curves.ease);
                                },
                                child: AppLargeText(
                                  text: _onboardingInfo.selectedPage ==
                                          _onboardingInfo.getDetailsLength() - 1
                                      ? " "
                                      : 'Skip',
                                  color: MyColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      addVerticalSpace(18.sp),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage(
                                  _onboardingInfo.getImages(index),
                                ),
                                fit: BoxFit.contain)),
                        //  padding: EdgeInsets.fromLTRB(100, 100, 30, 0),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),

                      addVerticalSpace(ScreenUtil().setHeight(62)),
                      AppLargeText(
                        text: _onboardingInfo.getTitle(index),
                        color: MyColors.backgroundColor,
                        size: 32,
                      ),
                      addVerticalSpace(18.sp),
                      AppText(
                        text: _onboardingInfo.getDescription(
                          index,
                        ),
                        color: MyColors.backgroundColor,
                        size: 20,
                      ),
                      addVerticalSpace(124.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(''),
                          Text(''),
                          SmoothPageIndicator(
                              effect: WormEffect(
                                  activeDotColor: Colors.black,
                                  dotWidth: 10,
                                  dotHeight: 10,
                                  dotColor: MyColors.backgroundColor),
                              controller: controller,
                              count: 3),
                          Container(
                            margin: _onboardingInfo.selectedPage ==
                                    _onboardingInfo.getDetailsLength() - 1
                                ? EdgeInsets.only(right: 0)
                                : EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (_onboardingInfo.selectedPage ==
                                        _onboardingInfo.getDetailsLength() -
                                            1) {
                                      Navigator.pushNamed(
                                          context, RouteName.loginPage);
                                    } else {
                                      controller.nextPage(
                                          duration:
                                              Duration(microseconds: 3000),
                                          curve: Curves.ease);
                                    }
                                  },
                                  child: AppLargeText(
                                    text: _onboardingInfo.selectedPage ==
                                            _onboardingInfo.getDetailsLength() -
                                                1
                                        ? "Get Started"
                                        : 'Next',
                                    color: MyColors.backgroundColor,
                                  ),
                                ),
                                Icon(
                                    _onboardingInfo.selectedPage ==
                                            _onboardingInfo.getDetailsLength() -
                                                1
                                        ? null
                                        : Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                    size: 30.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
//           child: PageView(
//             controller: controller,
//             children: [
//               Container(
//                 child: Stack(children: [
//                   Flex(
//                     direction: Axis.vertical,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height ,
//                           child: Container(
//                           color: MyColors.backgroundColor),
//                         ),
//                       ),
//                       ClipPath(
//                         clipper: CustomClipPart(),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: MyColors.primaryColor,
//                             borderRadius:
//                                 BorderRadius.vertical(top: Radius.circular(20)),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black,
//                                 blurRadius: 7,
//                                 offset:
//                                     Offset(0, 10), // changes position of shadow
//                               ),
//                             ],
//                           ),
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.6,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Center(
//                     child: Padding(
//                       padding:
//                           const EdgeInsets.only(left: 22, right: 22, top: 50),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: 340,
//                             width: 330,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Image.asset(
//                               "assets/slide1.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           addVerticalSpace(67),
//                           AppLargeText(
//                             text: 'Anywhere & Anytime',
//                             color: MyColors.backgroundColor,
//                           ),
//                           addVerticalSpace(37),
//                           SizedBox(
//                             height: 70,
//                             width: 280,
//                             child: AppText(
//                                 text:
//                                     'Read and  complete your bible task anywhere and anytime .',
//                                 color: MyColors.backgroundColor),
//                           ),
//                           addVerticalSpace(70),
//                           SmoothPageIndicator(
//                               effect: ExpandingDotsEffect(
//                                   dotWidth: 10,
//                                   dotHeight: 7,
//                                   activeDotColor: MyColors.backgroundColor),
//                               controller: controller,
//                               count: 3)
//                         ],
//                       ),
//                     ),
//                   )
//                 ]),
//               ),
//               Container(
//                 child: Stack(children: [
//                   Flex(
//                     direction: Axis.vertical,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 2,
//                           child: Container(color: MyColors.backgroundColor),
//                         ),
//                       ),
//                       ClipPath(
//                         clipper: CustomClipPart(),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: MyColors.primaryColor,
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(20))),
//                           width: MediaQuery.of(context).size.width,
//                           height: 550,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Center(
//                     child: Padding(
//                       padding:
//                           const EdgeInsets.only(left: 22, right: 22, top: 50),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: 340,
//                             width: 330,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Image.asset(
//                               "assets/slide2.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           addVerticalSpace(67),
//                           AppLargeText(
//                             text: 'Audio Feature',
//                             color: MyColors.backgroundColor,
//                           ),
//                           addVerticalSpace(37),
//                           SizedBox(
//                             height: 70,
//                             width: 280,
//                             child: AppText(
//                                 text:
//                                     'With our audio feature you can now listen to bible verses.',
//                                 color: MyColors.backgroundColor),
//                           ),
//                           addVerticalSpace(70),
//                           SmoothPageIndicator(
//                               effect: ExpandingDotsEffect(
//                                   dotWidth: 10,
//                                   dotHeight: 7,
//                                   activeDotColor: MyColors.backgroundColor),
//                               controller: controller,
//                               count: 3)
//                         ],
//                       ),
//                     ),
//                   )
//                 ]),
//               ),
//               Container(
//                 child: Stack(children: [
//                   Flex(
//                     direction: Axis.vertical,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height / 2,
//                           child: Container(color: MyColors.backgroundColor),
//                         ),
//                       ),
//                       ClipPath(
//                         clipper: CustomClipPart(),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: MyColors.primaryColor,
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(20))),
//                           width: MediaQuery.of(context).size.width,
//                           height: 550,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           left: 22, right: 22, top: 50, bottom: 22),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: 340,
//                             width: 330,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Image.asset(
//                               "assets/slide3.png",
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           // addVerticalSpace(67),
//                           AppLargeText(
//                             text: 'Set Reminder',
//                             color: MyColors.backgroundColor,
//                           ),
//                           addVerticalSpace(37),
//                           SizedBox(
//                             height: 70,
//                             width: 280,
//                             child: AppText(
//                                 text:
//                                     'Set a reminder for a particular time to read day and night.',
//                                 color: MyColors.backgroundColor),
//                           ),
//                           addVerticalSpace(70),
//                           SmoothPageIndicator(
//                               effect: ExpandingDotsEffect(
//                                   dotWidth: 10,
//                                   dotHeight: 7,
//                                   activeDotColor: MyColors.backgroundColor),
//                               controller: controller,
//                               count: 3),
//                           addVerticalSpace(140),
//                           Align(
//                             alignment: Alignment.bottomRight,
//                             child: SizedBox(
//                               height: 40,
//                               width: 80,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     primary: MyColors.primaryColor),
//                                 onPressed: () {
//                                   Navigator.pushNamed(
//                                       context, RouteName.signInPage);
//                                 },
//                                 child: Text('Next'),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ]),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomClipPart extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = size.width;
//     double h = size.height;

//     final path = Path();
//     path.lineTo(0, h);
//     path.quadraticBezierTo(w, h, w, h / 4);
//     path.lineTo(w, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
