import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spiritual_daily_guide/services/auth.dart';
import 'package:spiritual_daily_guide/sign_in/validators.dart';
import 'package:spiritual_daily_guide/utils/colors.dart';
import 'package:spiritual_daily_guide/widgets/app_text.dart';
import 'package:spiritual_daily_guide/widgets/custom_button.dart';
import 'package:spiritual_daily_guide/widgets/down_layouts_container.dart';
import 'package:spiritual_daily_guide/widgets/helper_tools.dart';
import 'package:spiritual_daily_guide/widgets/input__field.dart';
import 'package:spiritual_daily_guide/widgets/show_alert_dialogue.dart';

import '../route_folder/route_names.dart';
import '../widgets/app_large_text.dart';
import '../widgets/up_layout_container.dart';

class LoginPage extends StatefulWidget with EmailAndPasswordValidators {
  LoginPage({required this.auth, super.key});
  final AuthBase auth;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  final _emailController = TextEditingController();
  final _passwordControler = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordControler.text;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordControler.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool _submitted = false;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      await widget.auth.signInWithEmailAndPassword(_email, _password);
      Navigator.of(context).pop();
    } catch (e) {
      showAlertDialogue(context,
          title: "Sign in Failed",
          content: e.toString(),
          defaultActionText: 'ok');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            UpLayoutContainer(),
            DownLayoutContainer(),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 230, left: 50, right: 30, bottom: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  addVerticalSpace(220),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'D',
                                  style: GoogleFonts.nunitoSans(
                                      color: MyColors.primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'aily Reminder',
                                      style: GoogleFonts.nunitoSans(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            addVerticalSpace(78),
                            AppText(
                              text: 'SIGN IN',
                              size: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            addVerticalSpace(45),
                            Column(
                              children: [
                                EmailInputField(),
                                addVerticalSpace(77),
                                PasswordInputField(),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Forgot Password?'),
                                addHorizontalSpace(0),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'click here',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(46),
                            Center(
                                child: CustomButton(
                                    onpressed: submitEnabled ? _submit : null,
                                    text: 'Log In')),
                          ],
                        ),
                      ),
                      addVerticalSpace(46),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            AppLargeText(text: 'not yet a member?'),
                            addHorizontalSpace(18),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 30.sp,
                                width: 30.sp,
                                decoration: BoxDecoration(
                                  color: MyColors.primaryColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  onPressed: (() {
                                    Navigator.pushNamed(
                                        context, RouteName.SignUpPage);
                                  }),
                                  icon: Icon(Icons.add,
                                      color: Colors.white, size: 26),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputField EmailInputField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return InputField(
      textController: _emailController,
      keyboardType: TextInputType.emailAddress,
      labelText: 'E-mail',
      obscure: false,
      enabled: !_isLoading,
      focusNode: _passwordFocusNode,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingComplete,
      onChanged: (String email) => _updateState(),
      errorText: showErrorText ? widget.inValidEmailErrorText : null,
    );
  }

  InputField PasswordInputField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return InputField(
      obscure: _secureText,
      textController: _passwordControler,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      labelText: 'Password',
      focusNode: _emailFocusNode,
      enabled: !_isLoading,
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _secureText = !_secureText;
            });
          },
          icon: Icon(
            _secureText ? Icons.visibility : Icons.visibility_off,
          )),
      onEditingComplete: _submit,
      onChanged: (String password) => _updateState,
      errorText: showErrorText ? widget.inValidPasswordErrorText : null,
    );
  }

  void _updateState() {
    setState(() {});
  }
}
