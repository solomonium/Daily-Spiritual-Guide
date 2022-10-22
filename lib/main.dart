import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spiritual_daily_guide/utils/colors.dart';

import 'route_folder/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top])
      .then((_) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth =  MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: Size(375, 812),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Daily Spiritual Guide',
            debugShowCheckedModeBanner: false,
            color: MyColors.primaryColor,
            theme: ThemeData(
              primaryColor: MyColors.primaryColor,
              scaffoldBackgroundColor: MyColors.backgroundColor,
            ),
            onGenerateRoute: Router.generateRoute,
            builder: ((context, child) {
              return AnnotatedRegion<SystemUiOverlayStyle>(
                child: child!,
                value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  // systemNavigationBarColor: Color(0XFFFFFFFF),
                  //  systemNavigationBarIconBrightness: Brightness.dark,
                ),
              );
            }),
          );
        });
  }
}
