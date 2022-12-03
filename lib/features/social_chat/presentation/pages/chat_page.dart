import 'package:e_learning_app/features/settings/presentation/widgets/setting_app_bar.dart';
import 'package:e_learning_app/features/social_chat/presentation/widgets/chat_bottom_action.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../states/provider/chat_provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = GetIt.I<ChatProvider>();

    return Scaffold(
      appBar: const SettingAppBar(title: "Nguyen Yen Nhi"),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            ChatBottomAction(provider: provider),
          ],
        ),
      ),
    );
  }
}
