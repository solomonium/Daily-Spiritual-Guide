import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spiritual_daily_guide/sign_in/validators.dart';
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

class SignUpPage extends StatefulWidget with EmailAndPasswordValidators {
  SignUpPage({required this.auth, super.key});
  final AuthBase auth;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _secureText = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordControler = TextEditingController();
  final _confirmPasswordControler = TextEditingController();
  String get _email => _emailController.text;
  String get _password => _passwordControler.text;
  String get _name => _nameController.text;
  String get _confirmPassword => _confirmPasswordControler.text;

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  void _getEditingComplete(FocusNode target) {
    FocusScope.of(context).requestFocus(target);
  }

  bool _submitted = false;

  void _register() async {
    setState(() {
      _submitted = true;
    });
    try {
      await widget.auth.createEmailAndPassword(_email, _password);
      Navigator.of(context).pushNamed(RouteName.loginPage);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        widget.nameValidator.isValid(_name) &&
        widget.confirmPasswordValidator.isValid(_confirmPassword);
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
                    nameTextField(),
                    addVerticalSpace(54),
                    EmailTextField(),
                    addVerticalSpace(63),
                    PasswordTextField(),
                    addVerticalSpace(62),
                    ConfirmPasswordTextField(),
                    addVerticalSpace(59),
                    Center(
                        child: CustomButton(
                            onpressed: submitEnabled ? _register : null,
                            text: 'Sign Up')),
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

  InputField ConfirmPasswordTextField() {
    bool showErrorText = _submitted &&
        !widget.confirmPasswordValidator.isValid(_confirmPassword);

    return InputField(
      obscure: _secureText,
      textController: _confirmPasswordControler,
      keyboardType: TextInputType.text,
      labelText: 'Confirm Password',
      focusNode: _confirmPasswordFocusNode,
      textInputAction: TextInputAction.done,
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _secureText = !_secureText;
            });
          },
          icon: Icon(
            _secureText ? Icons.visibility : Icons.visibility_off,
          )),
      onChanged: (String) {},
      onEditingComplete: _register,
      errorText: showErrorText ? widget.invalidConfirmPassword : null,
      // validator: (confirmPassword) {
      //   // if (_confirmPassword == _password) {
      //   //   return null;
      //   // }
      //   // return 'Pasword not matched';
      // },
    );
  }

  InputField PasswordTextField() {
    bool showErrorText =
        _submitted && !widget.passwordValidator.isValid(_password);
    return InputField(
      obscure: _secureText,
      textController: _passwordControler,
      keyboardType: TextInputType.text,
      labelText: 'Password',
      focusNode: _passwordFocusNode,
      textInputAction: TextInputAction.next,
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _secureText = !_secureText;
            });
          },
          icon: Icon(
            _secureText ? Icons.visibility : Icons.visibility_off,
          )),
      onChanged: (String) {},
      onEditingComplete: () {
        _getEditingComplete(_confirmPasswordFocusNode);
      },
      errorText: showErrorText ? widget.inValidPasswordErrorText : null,
    );
  }

  InputField EmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return InputField(
      textController: _emailController,
      keyboardType: TextInputType.emailAddress,
      labelText: 'E-mail',
      obscure: false,
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onChanged: (String) {},
      onEditingComplete: () {
        _getEditingComplete(_passwordFocusNode);
      },
      errorText: showErrorText ? widget.inValidPasswordErrorText : null,
    );
  }

  InputField nameTextField() {
    bool showErrorText = _submitted && !widget.nameValidator.isValid(_name);
    return InputField(
      textController: _nameController,
      keyboardType: TextInputType.name,
      labelText: 'Name',
      obscure: false,
      textInputAction: TextInputAction.next,
      focusNode: _nameFocusNode,
      onChanged: (String) {},
      onEditingComplete: () {
        _getEditingComplete(_emailFocusNode);
      },
      errorText: showErrorText ? widget.inValidNameErrorText : null,
    );
  }
}
