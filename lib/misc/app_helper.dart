import 'dart:io';

import 'package:flutter/foundation.dart';

class AppHelper {
  static String getDevice() {
    if (Platform.isAndroid) {
      return "mobile";
    } else if (Platform.isMacOS) {
      return "laptop";
    } else if (Platform.isFuchsia) {
      return "mobile";
    } else if (Platform.isLinux) {
      return "laptop";
    } else if (Platform.isWindows) {
      return "laptop";
    } else {
      return "laptop";
    }
  }
}

safePrint(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}
