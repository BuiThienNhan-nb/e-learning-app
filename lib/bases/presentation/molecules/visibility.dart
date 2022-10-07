import 'package:flutter/material.dart';

import '../../../core/app/values.dart';
import '../../../utils/extensions/list_extension.dart';

class VisibilityWidget extends StatelessWidget {
  const VisibilityWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: AppValues.instance.currentUser!.role ==
              AppValues.instance.title.toCurrentLocale().last
          ? true
          : false,
      child: child,
    );
  }
}
