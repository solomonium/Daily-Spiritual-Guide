// import 'package:flutter/material.dart' hide Router;
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:spiritual_daily_guide/utils/colors.dart';

// import 'route_folder/router.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Daily Spiritual Guide',
//       debugShowCheckedModeBanner: false,
//       color: MyColors.primaryColor,
//       theme: ThemeData(
//         primaryColor: MyColors.primaryColor,
//       ),
//       onGenerateRoute: Router.generateRoute,
//     );
//   }
// }

import 'package:spiritual_daily_guide/exports.dart';

import 'extentions/navigation.dart';

void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: SpiritualGuide(),
    ),
  );
}

class SpiritualGuide extends StatefulWidget {
  const SpiritualGuide({Key? key}) : super(key: key);

  @override
  State<SpiritualGuide> createState() => _SpiritualGuideState();
}

class _SpiritualGuideState extends State<SpiritualGuide> {
  @override
  Widget build(BuildContext context) {
    var themeType = context.select<AppProvider, ThemeType>((val) => val.theme);

    AppTheme theme = AppTheme.fromType(themeType);
    return Provider.value(
      value: theme,
      child: MaterialApp(
        navigatorKey: R.N.navKey,
        title: 'Daily Spiritual Guide',
        theme: theme.themeData,
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreens(),
        onGenerateRoute: Router.generateRoute,
        builder: (context, child) => MediaQuery(
          data: context.widthPx < 600
              ? context.mq.copyWith(textScaleFactor: .8)
              : context.mq.copyWith(textScaleFactor: 1),
          child: InAppNotification(
            key: R.N.notifyKey,
            safeAreaPadding: EdgeInsets.zero,
            minAlertHeight: 40.0,
            child: child,
          ),
        ),
      ),
    );
  }
}
