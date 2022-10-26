import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/utils/animation.dart';
import 'package:spiritual_daily_guide/utils/app_styles.dart';

import '../route_folder/routes.dart';

//Requires the animations package

typedef PageBuilder = Widget Function();

class R {
  static final N = MyRoutes();
}

class RouteHelper {
  static const double kDefaultDuration = .35;
  static const Curve kDefaultEaseFwd = Curves.easeOut;
  static const Curve kDefaultEaseReverse = Curves.easeOut;

  static Route<T> fade<T>(PageBuilder pageBuilder,
      [double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => pageBuilder(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static Route<T> fadeThrough<T>(PageBuilder pageBuilder,
      [double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => pageBuilder(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child);
      },
    );
  }

  static Route<T> fadeScale<T>(PageBuilder pageBuilder,
      [double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => pageBuilder(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeScaleTransition(
        animation: animation,
        child: Overlay(
          initialEntries: [OverlayEntry(builder: (context) => child)],
        ),
      ),
    );
  }

  static Route<T> sharedAxis<T>(PageBuilder pageBuilder,
      [SharedAxisTransitionType type = SharedAxisTransitionType.scaled,
      double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => pageBuilder(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: type,
          child: child,
        );
      },
    );
  }

  static Route<T> slide<T>(PageBuilder pageBuilder,
      {double duration = kDefaultDuration,
      Offset startOffset = const Offset(1, 0),
      Curve easeFwd = kDefaultEaseFwd,
      Curve easeReverse = kDefaultEaseReverse}) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => pageBuilder(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        bool reverse = animation.status == AnimationStatus.reverse;
        return SlideTransition(
          position: Tween<Offset>(begin: startOffset, end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: animation, curve: reverse ? easeReverse : easeFwd)),
          child: child,
        );
      },
    );
  }
}

extension NamedRouter on String {
  navigateToNamedRoute() {
    ///this navigate to next page but do not replace the Named route it takes string alias of route name

    Navigator.pushNamed(AppContext.materialBuildContext, this);
  }

  navigateToReplaceNamedRoute() {
    ///this navigate to next page and replace the Named route it takes string alias of route name
    Navigator.pushReplacementNamed(context, this);
  }
}

extension NavigationManager on Widget {
  navigateToRoutePushPage() {
    ///this navigate  to next page(by pushing into the stack) but do not replace the Widget Class Page not String

    Navigator.push(AppContext.materialBuildContext,
        MaterialPageRoute(builder: (BuildContext context) => this));
  }

  animateToRoutePushPage(
      {SharedAxisTransitionType transitionType =
          SharedAxisTransitionType.horizontal,
      bool replacePg = false}) {
    ///this navigate  to next page(by pushing into the stack) but do not replace the Widget Class Page not String
    AnimateToPage.navigateRoute(AppContext.materialBuildContext,
        transitionType: transitionType, gotoPage: this, replacePg: replacePg);
  }

  navigateToDestinationReplacePage() {
    ///this navigate to next page and replace the the current page with destination page

    Navigator.pushReplacement(AppContext.materialBuildContext,
        MaterialPageRoute(builder: (BuildContext context) => this));
  }

  popOfPage(BuildContext context) {
    ///this pop of the current screen
    Navigator.pop(context);
  }
}

extension NavigateTimer on Widget {
  Future navigateToNamePageTimer() {
    return Future.delayed(const Duration(seconds: 4), () {
      // this.animateToRoutePushPage();
      ///animate the splash screen to auth choice
      AnimateToPage.navigateRoute(AppContext.materialBuildContext,
          replacePg: true,
          transitionType: SharedAxisTransitionType.horizontal,
          gotoPage: this);
    });
  }
}
