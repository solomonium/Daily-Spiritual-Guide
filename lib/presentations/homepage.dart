import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/widgets/app_large_text.dart';
import 'package:spiritual_daily_guide/widgets/app_text.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent.withOpacity(0.4),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(text: 'Hi, Jeremy!'),
                addVerticalSpace(10),
                AppText(text: 'Let God lead you today!')
              ],
            ),
          ),
        ));
  }
}
