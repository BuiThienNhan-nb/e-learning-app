import 'package:form_field_validator/form_field_validator.dart';

class AppValidations {
  AppValidations._internal();

  static AppValidations instance = AppValidations._internal();

  factory AppValidations() {
    return instance;
  }

  final emailValidator = MultiValidator(
    [
      EmailValidator(errorText: 'Please enter a valid email!'),
      RequiredValidator(errorText: 'Email is required!'),
      WhiteSpaceValidator(errorText: 'Email must not contain whitespace!'),
    ],
  );

  final passwordValidator = MultiValidator(
    [
      RequiredValidator(errorText: 'Password is required!'),
      MinLengthValidator(6,
          errorText: 'Password must be at least 6 digits long!'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'Passwords must have at least one special character!'),
      WhiteSpaceValidator(errorText: 'Password must not contain whitespace!'),
    ],
  );
}

class WhiteSpaceValidator extends TextFieldValidator {
  // pass the error text to the super constructor
  WhiteSpaceValidator({required String errorText}) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    // return true if the value is valid according the your condition
    return !value!.contains(' ');
  }
}
