import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spiritual_daily_guide/utils/colors.dart';

import 'route_folder/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Spiritual Guide',
      debugShowCheckedModeBanner: false,
      color: MyColors.primaryColor,
      theme: ThemeData(
        primaryColor: MyColors.primaryColor,
      ),
      onGenerateRoute: Router.generateRoute,
    );
  }
}
