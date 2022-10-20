import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/presentations/login_page.dart';
import 'package:spiritual_daily_guide/presentations/onboarding_page.dart';
import 'package:spiritual_daily_guide/services/auth.dart';

import '../presentations/landing_page.dart';
import '../presentations/signUp_page.dart';
import '../presentations/splash_screen.dart';
import 'route_names.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouteName.signInPage:
      // return MaterialPageRoute(
      //   builder: (_) => const SignInPage(),);
      case RouteName.onboarding_page:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
      case RouteName.loginPage:
        return MaterialPageRoute(
          builder: (_) =>  LoginPage(auth: Auth(),),
        );
      case RouteName.SignUpPage:
        return MaterialPageRoute(
          builder: (_) => SignUpPage(auth: Auth(),),
        );
      case RouteName.landing_page:
        return MaterialPageRoute(
            builder: (_) => LandingPage(
                  auth: Auth(),
                ));
      default:
        return MaterialPageRoute(builder: (_) =>  LoginPage(auth: Auth(),));
    }
  }
}
