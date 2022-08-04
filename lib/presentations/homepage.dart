import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/widgets/app_text.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';
import 'package:spiritual_daily_guide/widgets/input_field.dart';

import '../widgets/app_large_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController pinEditingController = TextEditingController();
  TextEditingController confirmPinEditingController = TextEditingController();
  int _counter = 0;
  bool nameVisibilty = false;
  bool confirmPinVisibilty = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(_counter);
      nameVisibilty = !nameVisibilty;
      confirmPinVisibilty = !confirmPinVisibilty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/DSG_bg.jpeg"), fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLargeText(
                  text: 'Daily Spiritual Guide',
                  color: Colors.white,
                ),
                addVerticalSpace(50),
                Wrap(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 30),
                            child: ListView(
                              children: [
                                Visibility(
                                  visible: nameVisibilty,
                                  child: InputFieldWidget(
                                      textInputType: TextInputType.emailAddress,
                                      labelText: 'Name',
                                      textController: nameEditingController,
                                      autoFocus: true,
                                      textInputAction: TextInputAction.next),
                                ),
                                addVerticalSpace(10),
                                InputFieldWidget(
                                    textInputType: TextInputType.emailAddress,
                                    labelText: 'Email',
                                    textController: emailEditingController,
                                    autoFocus: true,
                                    textInputAction: TextInputAction.next),
                                addVerticalSpace(10),
                                InputFieldWidget(
                                    textInputType: TextInputType.emailAddress,
                                    labelText: 'Pin',
                                    textController: pinEditingController,
                                    autoFocus: true,
                                    textInputAction: TextInputAction.next),
                                addVerticalSpace(10),
                                Visibility(
                                  visible: confirmPinVisibilty,
                                  child: InputFieldWidget(
                                      textInputType: TextInputType.number,
                                      labelText: 'Confirm Pin',
                                      textController:
                                          confirmPinEditingController,
                                      autoFocus: true,
                                      textInputAction: TextInputAction.done),
                                ),
                                addVerticalSpace(30),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: AppText(
                                      text: 'Sign In',
                                      size: 20,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
