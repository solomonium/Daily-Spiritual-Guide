// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:spiritual_daily_guide/nav_pages.dart';
// import 'package:spiritual_daily_guide/widgets/app_text.dart';
// import 'package:spiritual_daily_guide/widgets/helper_tools.dart';
// import 'package:spiritual_daily_guide/widgets/input_field.dart';

// import '../widgets/app_large_text.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({Key? key}) : super(key: key);

//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   TextEditingController nameEditingController = TextEditingController();
//   TextEditingController emailEditingController = TextEditingController();
//   TextEditingController pinEditingController = TextEditingController();
//   TextEditingController confirmPinEditingController = TextEditingController();
//   int _counter = 0;
//   bool nameVisibilty = false;
//   bool confirmPinVisibilty = false;
//   bool isSignIn = true;
//   bool verifying = false;

//   void _incrementCounter() {
//     setState(() {
//       nameVisibilty = !nameVisibilty;
//       confirmPinVisibilty = !confirmPinVisibilty;
//       isSignIn = !isSignIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(children: [
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             // color: Color.fromRGBO(113, 21, 156, 1),
//             // backgroundBlendMode: BlendMode,
//             image: DecorationImage(
//                 colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.6), BlendMode.darken),
//                 image: const AssetImage("assets/DSG_2.png"),
//                 fit: BoxFit.cover),
//           ),
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AppLargeText(
//                   text: 'Daily Spiritual Guide',
//                   color: Colors.white,
//                 ),
//                 addVerticalSpace(50),
//                 Wrap(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(25),
//                       child: BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//                         child: Container(
//                           // height: MediaQuery.of(context).size.height * 0.65,
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           // color: Color.fromARGB(255, 203, 151, 229)
//                           //     .withOpacity(0.4),
//                           color: Colors.white.withOpacity(0.4),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 0, horizontal: 30),
//                             child: ListView(
//                               shrinkWrap: true,
//                               children: [
//                                 Visibility(
//                                   visible: nameVisibilty,
//                                   child: InputFieldWidget(
//                                       textInputType: TextInputType.emailAddress,
//                                       labelText: 'Name',
//                                       textController: nameEditingController,
//                                       autoFocus: true,
//                                       textInputAction: TextInputAction.next),
//                                 ),
//                                 addVerticalSpace(10),
//                                 InputFieldWidget(
//                                     textInputType: TextInputType.emailAddress,
//                                     labelText: 'Email',
//                                     textController: emailEditingController,
//                                     autoFocus: true,
//                                     textInputAction: TextInputAction.next),
//                                 addVerticalSpace(10),
//                                 InputFieldWidget(
//                                     textInputType: TextInputType.emailAddress,
//                                     labelText: 'Pin',
//                                     textController: pinEditingController,
//                                     autoFocus: true,
//                                     textInputAction: TextInputAction.next),
//                                 addVerticalSpace(10),
//                                 Visibility(
//                                   visible: confirmPinVisibilty,
//                                   child: InputFieldWidget(
//                                       textInputType: TextInputType.number,
//                                       labelText: 'Confirm Pin',
//                                       textController:
//                                           confirmPinEditingController,
//                                       autoFocus: true,
//                                       textInputAction: TextInputAction.done),
//                                 ),
//                                 addVerticalSpace(30),
//                                 isSignIn
//                                     ? ElevatedButton(
//                                         onPressed: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     const Dashboard()),
//                                           );
//                                         },
//                                         child: verifying
//                                             ? const Center(
//                                                 child:
//                                                     CircularProgressIndicator())
//                                             : AppText(
//                                                 text: 'Sign In',
//                                                 size: 20,
//                                                 color: Colors.white,
//                                               ))
//                                     : ElevatedButton(
//                                         onPressed: () {},
//                                         child: AppText(
//                                           text: 'Sign Up',
//                                           size: 20,
//                                           color: Colors.white,
//                                         )),
//                                 addVerticalSpace(10)
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         )
//       ]),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           isSignIn
//               ? AppText(
//                   text: 'Not yet a member',
//                   size: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 )
//               : AppText(
//                   text: 'Already a member?',
//                   size: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//           const Icon(
//             Icons.east,
//             color: Colors.white,
//           ),
//           FloatingActionButton(
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }
