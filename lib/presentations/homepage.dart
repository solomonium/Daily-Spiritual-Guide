import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spiritual_daily_guide/widgets/app_large_text.dart';
import 'package:spiritual_daily_guide/widgets/app_text.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';
import 'package:spiritual_daily_guide/widgets/my_card.dart';

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
                AppText(text: 'Let Holy Spirit inspire you today!'),
                addVerticalSpace(20),
                MyCard(
                  width: double.infinity,
                  height: 250,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: "Word for Today:",
                                size: 18,
                                color: Colors.black54,
                              ),
                              AppLargeText(
                                text: DateFormat("dd-MMM-yyyy")
                                    .format(DateTime.now()),
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          addVerticalSpace(5),
                          SizedBox(
                            width: 300,
                            height: 150,
                            child: Center(
                              child: AppText(
                                  size: 18,
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
                            ),
                          ),
                          addVerticalSpace(10),
                          Align(
                            alignment: Alignment.center,
                            child: AppLargeText(
                              text: 'Tap to Read Anchor Text: Gen 1 vs 1',
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                addVerticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: MyCard(
                      width: 150,
                      height: 100,
                      child: Column(),
                    )),
                    addHorizontalSpace(20),
                    Expanded(
                        child: MyCard(
                      width: 150,
                      height: 100,
                      child: Column(),
                    ))
                  ],
                ),
                addVerticalSpace(10),
                AppLargeText(
                  text: 'Plans for Today',
                  size: 18,
                )
              ],
            ),
          ),
        ));
  }
}
