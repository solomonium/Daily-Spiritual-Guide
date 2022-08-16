import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spiritual_daily_guide/presentations/signIn_page.dart';
import 'package:spiritual_daily_guide/widgets/app_large_text.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _authStatus;

  @override
  void initState() {
    super.initState();
    // LocalStoreHelper.getTheme();
    Timer(const Duration(seconds: 3), () => const SignInPage());
  }

  @override
  Widget build(BuildContext context) {
    // if (_authStatus == AuthStatus.LOGGED_IN) {
    //   return const Dashboard();
    // } else if (_authStatus == AuthStatus.LOGGED_OUT) {
    //   return const WelcomePage();
    // }
    return Scaffold(
      backgroundColor: const Color(0xe671159C),
      body: SafeArea(
          child: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          ),
        ),
      )),
    );
  }

  // void getAuthStatus() async {
  //   final authStatus = await LocalStoreHelper.isAuth();
  //   setState(() {
  //     _authStatus = authStatus;
  //   });
  // }
}
