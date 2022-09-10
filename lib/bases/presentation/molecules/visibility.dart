import 'package:e_learning_app/core/app/values.dart';
import 'package:flutter/material.dart';

class VisibilityWidget extends StatelessWidget {
  const VisibilityWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          AppValues.currentUser!.role == AppValues.roles.last ? true : false,
      child: child,
    );
  }
}
