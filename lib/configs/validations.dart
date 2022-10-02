import 'package:easy_localization/easy_localization.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../generated/translations/locale_keys.g.dart';

class AppValidations {
  AppValidations._internal();

  static AppValidations instance = AppValidations._internal();

  factory AppValidations() {
    return instance;
  }

  final emailValidator = MultiValidator(
    [
      EmailValidator(errorText: LocaleKeys.invalidEmail.tr()),
      RequiredValidator(errorText: LocaleKeys.emailRequired.tr()),
      WhiteSpaceValidator(errorText: LocaleKeys.emailWhiteSpace.tr()),
    ],
  );

  final nameValidator =
      RequiredValidator(errorText: LocaleKeys.nameRequired.tr());

  final passwordValidator = MultiValidator(
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
