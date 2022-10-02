// import 'package:e_learning_app/generated/translations/locale_keys.g.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// import '../../../../configs/colors.dart';
// import '../../../../configs/dimens.dart';
// import '../../../../configs/styles.dart';
// import '../../../../utils/extensions/context_extension.dart';
// import '../state/provider/auth_page_provider.dart';
// import 'package:easy_localization/easy_localization.dart';

// class AuthPageHeader extends StatelessWidget {
//   const AuthPageHeader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final provider = context.read<AuthPageProvider>();

//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.neutral.shade300,
//         borderRadius: BorderRadius.circular(AppDimens.largeRadius),
//       ),
//       margin: EdgeInsets.symmetric(
//         vertical: AppDimens.extraLargeHeightDimens,
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: AppDimens.smallHeightDimens,
//           horizontal: AppDimens.mediumWidthDimens,
//         ),
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: InkWell(
//                 onTap: () => provider.goToSignIn(),
//                 child: Selector<AuthPageProvider, bool>(
//                   shouldRebuild: ((previous, next) => previous != next),
//                   selector: (_, provider) => provider.isLogin,
//                   builder: (_, isLogin, child) => Container(
//                     padding: EdgeInsets.symmetric(
//                       vertical: isLogin ? 10.h : 0.0,
//                     ),
//                     decoration: isLogin
//                         ? BoxDecoration(
//                             color: AppColors.neutral.shade50,
//                             borderRadius:
//                                 BorderRadius.circular(AppDimens.largeRadius),
//                           )
//                         : null,
//                     alignment: Alignment.center,
//                     child: Text(
//                       LocaleKeys.signIn.tr(),
//                       style: context.textTheme.titleMedium?.copyWith(
//                         color: isLogin ? null : AppColors.neutral.shade400,
//                         fontWeight: AppStyles.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: InkWell(
//                 onTap: () => provider.goToSignUp(),
//                 child: Selector<AuthPageProvider, bool>(
//                   selector: (_, provider) => provider.isLogin,
//                   builder: (_, isLogin, child) => Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.symmetric(
//                       vertical: isLogin ? 0.0 : 10.h,
//                     ),
//                     decoration: !isLogin
//                         ? BoxDecoration(
//                             color: AppColors.neutral.shade50,
//                             borderRadius:
//                                 BorderRadius.circular(AppDimens.largeRadius),
//                           )
//                         : null,
//                     child: Text(
//                       LocaleKeys.signUp.tr(),
//                       style: context.textTheme.titleMedium?.copyWith(
//                         color: isLogin ? AppColors.neutral.shade400 : null,
//                         fontWeight: AppStyles.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
