import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spiritual_daily_guide/widgets/up_layout_container.dart';

import '../route_folder/route_names.dart';
import '../services/auth.dart';
import '../utils/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/down_layouts_container.dart';
import '../widgets/helper_tools.dart';
import '../widgets/input__field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({required this.auth, super.key});
  final AuthBase auth;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _secureText = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordControler = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordControler.text;

  void _register() async {
    try {
      await widget.auth.createEmailAndPassword(_email, _password);
      Navigator.of(context).pushNamed(RouteName.loginPage);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          UpLayoutContainer(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 250, left: 50, right: 30, bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  addVerticalSpace(220),

                    //addVerticalSpace(60),
                    AppText(
                      text: 'SIGN UP',
                      size: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    addVerticalSpace(23),
                    InputField(
                      textController: _nameController,
                      keyboardType: TextInputType.name,
                      labelText: 'Name',
                      obscure: false,
                      textInputAction: TextInputAction.next,
                      onChanged: (String) {},
                    ),
                    addVerticalSpace(54),
                    InputField(
                      textController: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'E-mail',
                      obscure: false,
                      textInputAction: TextInputAction.next,
                      onChanged: (String) {},
                    ),
                    addVerticalSpace(63),
                    InputField(
                      obscure: _secureText,
                      textController: _passwordControler,
                      keyboardType: TextInputType.text,
                      labelText: 'Password',
                       textInputAction: TextInputAction.next,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                          icon: Icon(
                            _secureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                      onChanged: (String) {},
                    ),
                    addVerticalSpace(62),
                    InputField(
                      obscure: _secureText,
                      textController: _passwordControler,
                      keyboardType: TextInputType.text,
                      labelText: 'Confirm Password',
                      textInputAction: TextInputAction.done,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                          icon: Icon(
                            _secureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                      onChanged: (String) {},
                    ),

                    addVerticalSpace(59),
                    Center(
                        child: CustomButton(onpressed: _register, text: 'Sign Up')),
                    addVerticalSpace(46),

                    Row(
                      children: [
                        AppLargeText(text: 'already a member?'),
                        addHorizontalSpace(18),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.loginPage);
                          },
                          child: Container(
                            height: 30.sp,
                            width: 30.sp,
                            decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child:
                                Icon(Icons.add, color: Colors.white, size: 26),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          DownLayoutContainer(),
        ],
      ),
    );
  }
}
