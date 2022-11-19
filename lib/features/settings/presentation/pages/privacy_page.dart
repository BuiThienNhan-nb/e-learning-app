import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../widgets/setting_app_bar.dart';

class PrivacyPage extends StatelessWidget {
  PrivacyPage({
    super.key,
    this.fileName = "assets/md/privacy_policy.md",
    this.title = "Privacy Policy",
  });

  String fileName = "assets/md/privacy_policy.md";
  String title = "Privacy Policy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(title: title),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 300))
              .then((value) => rootBundle.loadString(fileName)),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                data: snapshot.data.toString(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
