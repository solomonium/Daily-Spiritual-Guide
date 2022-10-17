import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/misc/in_app_notification.dart';

class MyRoutes {
  final GlobalKey<NavigatorState> navKey = GlobalKey();
  final GlobalKey<InAppNotificationState> notifyKey = GlobalKey();

  final String baseUrl = 'https://renndaar.herokuapp.com/api/v1';

  NavigatorState? get nav => navKey.currentState;
}
