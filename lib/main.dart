import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spiritual_daily_guide/presentations/signIn_page.dart';

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
      color: Colors.purple.shade300,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      onGenerateRoute: Router.generateRoute,
      // home: const SignInPage(),
    );
  }
}
