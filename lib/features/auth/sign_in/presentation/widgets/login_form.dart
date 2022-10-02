import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../bases/presentation/atoms/password_text_form_field.dart';
import '../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/validations.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../state/provider/auth_page_provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final AuthPageProvider provider;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: provider.signInKey,
      child: Column(
        children: [
          DefaultTextFormField(
            labelText: LocaleKeys.email.tr(),
            controller: provider.emailController,
            prefixIcon: "assets/icons/mail_icon.png",
            hintText: LocaleKeys.email.tr(),
            textInputType: TextInputType.emailAddress,
            validator: AppValidations.instance.emailValidator,
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          PasswordTextFormField(
            controller: provider.passwordController,
            validator: AppValidations.instance.passwordValidator,
          ),
        ],
      ),
    );
  }
}
