import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/presentations/signIn_page.dart';
import 'package:spiritual_daily_guide/route_folder/route_names.dart';
import 'package:spiritual_daily_guide/utils/colors.dart';
import 'package:spiritual_daily_guide/widgets/app_large_text.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   Timer(const Duration(seconds: 3), () => SignInPage());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: InkWell(
        onTap: () => Navigator.pushNamed(context, RouteName.landing_page),
        child: SafeArea(
            child: Container(
          color: MyColors.primaryColor,
          child: Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 356,
                      height: 236,
                      child: Image.asset("assets/dove_splash.png")),
                  addVerticalSpace(40),
                  SizedBox(
                      width: 372,
                      height: 100,
                      child: AppLargeText(
                        text: "DAILY FELLOWSHIP REMINDER",
                        color: Colors.white,
                      //  textAlign: TextAlign.center,
                      )),
                  addVerticalSpace(40),
                  AnimatedTextKit(
                    totalRepeatCount: 40,
                    animatedTexts: [
                      ScaleAnimatedText(
                        'Tap the Screen Proceed',
                        duration: Duration(milliseconds: 2000),
                        textStyle: const TextStyle(
                            color: MyColors.backgroundColor, fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  // void getAuthStatus() async {
  //   final authStatus = await LocalStoreHelper.isAuth();
  //   setState(() {
  //     _authStatus = authStatus;
  //   });
  // }
}
