abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator nameValidator = NonEmptyStringValidator();
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final StringValidator confirmPasswordValidator = NonEmptyStringValidator();

  final String inValidEmailErrorText = 'Email can\'t be empty';
  final String inValidPasswordErrorText = 'Password can\'t be empty';
  final String inValidNameErrorText = 'Name can\'t be empty';
  final String invalidConfirmPassword = 'Field can\'t be empty';
}
