import 'package:easy_localization/easy_localization.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../generated/translations/locale_keys.g.dart';

class AppValidations {
  AppValidations._internal();

  static AppValidations instance = AppValidations._internal();

  factory AppValidations() {
    return instance;
  }

  String? emailValidator(String value) => MultiValidator(
        [
          EmailValidator(errorText: LocaleKeys.invalidEmail.tr()),
          RequiredValidator(errorText: LocaleKeys.emailRequired.tr()),
          WhiteSpaceValidator(errorText: LocaleKeys.emailWhiteSpace.tr()),
        ],
      ).call(value);

  String? nameValidator(String value) =>
      RequiredValidator(errorText: LocaleKeys.nameRequired.tr()).call(value);

  String? birthdayValidator(String value) =>
      RequiredValidator(errorText: LocaleKeys.birthdayRequired.tr())
          .call(value);

  String? passwordValidator(String value) => MultiValidator(
        [
          RequiredValidator(errorText: LocaleKeys.passwordRequired.tr()),
          MinLengthValidator(
            6,
            errorText: LocaleKeys.passwordMin.tr(),
          ),
          PatternValidator(r'(?=.*?[#?!@$%^&*-])',
              errorText: LocaleKeys.passwordSpecialCharacter.tr()),
          WhiteSpaceValidator(errorText: LocaleKeys.passwordWhiteSpace.tr()),
        ],
      ).call(value);

  String? confirmPasswordValidator(String value1, String value2) {
    return MatchValidator(
      errorText: LocaleKeys.confirmPasswordNotMatch.tr(),
    ).validateMatch(value1, value2);
  }

  String? phoneNumberValidator(String value) =>
      PhoneValidator(errorText: LocaleKeys.phoneValid.tr()).call(value);
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

class PhoneValidator extends TextFieldValidator {
  PhoneValidator({required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => true;

  final phonePattern = RegExp(r"^[0-9]{10,11}$");

  @override
  bool isValid(String? value) =>
      (value!.startsWith('0') && phonePattern.hasMatch(value));
}
