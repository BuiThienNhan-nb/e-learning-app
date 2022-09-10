// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../configs/colors.dart';
// import '../../../features/auth/presentation/state/provider/auth_page_provider.dart';
// import '../../../generated/translations/locale_keys.g.dart';
// import 'text_form_field.dart';
// import 'package:easy_localization/easy_localization.dart';

// class PasswordTextFormField extends StatefulWidget {
//   final TextEditingController controller;
//   String? labelText;

//   PasswordTextFormField({
//     Key? key,
//     required this.controller,
//     this.labelText,
//   }) : super(key: key);

//   @override
//   State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
// }

// class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
//   bool togglePassword = true;
//   late Image suffixIcon;

//   @override
//   Widget build(BuildContext context) {
//     suffixIcon = togglePassword
//         ? Image.asset("assets/icons/password_hide_icon.png")
//         : Image.asset("assets/icons/password_show_icon.png");

//     return Consumer<AuthPageProvider>(
//       builder: (_, provider, __) => MyTextFormField(
//         labelText: widget.labelText ?? LocaleKeys.password.tr(),
//         controller: widget.controller,
//         prefixIcon: Image.asset(
//           "assets/icons/lock_icon.png",
//           color: provider.passwordFillColor,
//         ),
//         suffixIcon: GestureDetector(
//           onTap: () => setState(() => togglePassword = !togglePassword),
//           child: togglePassword
//               ? Image.asset(
//                   "assets/icons/password_hide_icon.png",
//                   color: provider.passwordFillColor,
//                 )
//               : Image.asset(
//                   "assets/icons/password_show_icon.png",
//                   color: provider.passwordFillColor,
//                 ),
//         ),
//         obscureText: togglePassword,
//         onFocus: (isFocused) => provider.passwordFillColor =
//             isFocused ? AppColors.primaryColor : AppColors.neutral.shade500,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../generated/translations/locale_keys.g.dart';
import 'text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  String? labelText;

  PasswordTextFormField({
    Key? key,
    required this.controller,
    this.labelText,
  }) : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool togglePassword = true;
  late Image suffixIcon;

  @override
  Widget build(BuildContext context) {
    suffixIcon = togglePassword
        ? Image.asset("assets/icons/password_hide_icon.png")
        : Image.asset("assets/icons/password_show_icon.png");

    return MyTextFormField(
      labelText: widget.labelText ?? LocaleKeys.password.tr(),
      controller: widget.controller,
      prefixIcon: "assets/icons/lock_icon.png",
      suffixIcon: togglePassword
          ? "assets/icons/password_hide_icon.png"
          : "assets/icons/password_show_icon.png",
      obscureText: togglePassword,
      onSuffixIconTap: () => setState(() => togglePassword = !togglePassword),
    );
  }
}
