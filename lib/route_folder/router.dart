import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/presentations/homepage.dart';
import 'package:spiritual_daily_guide/presentations/onboarding_page.dart';
import 'package:spiritual_daily_guide/presentations/signIn_page.dart';

import '../presentations/splash_screen.dart';
import 'route_names.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.signInPage:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RouteName.onboarding_page:
        return MaterialPageRoute(builder: (_) => const OnboardingScreens());
      default:
        return MaterialPageRoute(builder: (_) => const SignInPage());
    }
  }
}
