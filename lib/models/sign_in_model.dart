// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/sign_in/validators.dart';

import '../services/auth.dart';

class EmailSignInModel with EmailAndPasswordValidators, ChangeNotifier {
  EmailSignInModel(
    this.auth, {
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.submitted = false,
  });
  String email;
  String password;
  final AuthBase auth;
  bool submitted;
  bool isLoading;

  bool get canSubmit =>
      emailValidator.isValid(email) &&
      passwordValidator.isValid(password) &&
      !isLoading;

  String? get showEmailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? inValidEmailErrorText : null;
  }

  String? get showPasswordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? inValidPasswordErrorText : null;
  }

  void updateEmail(String email) => _updateWith(email: email);
  void updatePassword(String password) => _updateWith(password: password);

  void submit() async {
    _updateWith(submitted: true);
    _updateWith(isLoading: true);
    

    try {
      await auth.signInWithEmailAndPassword(email, password);
    } catch (e) {
      _updateWith(isLoading: false);
      rethrow;
    }
  }

  void _updateWith({
    String? email,
    String? password,
    bool? submitted,
    bool? isLoading,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;

    this.submitted = submitted ?? this.submitted;
    this.isLoading = isLoading ?? this.isLoading;
    notifyListeners();
  }
}
