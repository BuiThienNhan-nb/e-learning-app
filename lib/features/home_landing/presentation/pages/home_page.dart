import 'package:e_learning_app/bases/presentation/atoms/text_button.dart';
import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/default_result_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultTextButton(
          submit: () => submit(context),
          title: "Pop up animated Dialog",
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const DefaultResultDialog(
        content: "Wrong password or Email or Server just went wrong",
        isError: false,
      ),
    );
  }
}
