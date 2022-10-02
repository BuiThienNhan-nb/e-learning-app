import 'package:e_learning_app/configs/validations.dart';
import 'package:e_learning_app/features/auth/presentation/state/provider/auth_page_provider.dart';
import 'package:flutter/cupertino.dart';

import '../../../../bases/presentation/atoms/password_text_form_field.dart';
import '../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../configs/dimens.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final AuthPageProvider provider;

  @override
  Widget build(BuildContext context) {
    return Form(
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
