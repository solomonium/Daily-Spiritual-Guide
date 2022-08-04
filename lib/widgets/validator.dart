import 'package:spiritual_daily_guide/widgets/strings.dart';
import 'package:validators/validators.dart';

class Validator {
  static String? phone(value) {
    if (value.isEmpty) {
      return 'Please provide a phone number!';
    }
    if (!StringUtil.isPhone(value)) {
      return 'Please enter a valid phone number!';
    }
    return null;
  }

  static String? email(value) {
    if (value.isEmpty) {
      return 'Please provide your email address!';
    }
    if (!isEmail(value)) {
      return 'Please enter a valid email!';
    }
    return null;
  }

  static String? emailValidate(value) {
    if (value.isEmpty) {
      return ("Please Enter Your Email");
    }
    // reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please Enter a valid email");
    }
    return null;
  }

  static String? password(value) {
    if (value.isEmpty) {
      return 'Please provide your password!';
    }
    if (value.length < 3 || value.length > 100) {
      return 'Password must be between 3 - 100 characters!';
    }
    return null;
  }

  static String? noEmptyText(value) {
    if (value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  static String? noEmptyDropdown(value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option';
    }
    return null;
  }

  static String? phoneOrEmail(value) {
    if (value.isEmpty) {
      return 'Please provide an email or phone number!';
    }
    if (!isEmail(value) && !StringUtil.isPhone(value)) {
      return 'Please enter a valid email or phone number!';
    }
    return null;
  }
}
