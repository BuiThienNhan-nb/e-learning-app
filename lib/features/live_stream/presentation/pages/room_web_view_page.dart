import 'package:e_learning_app/core/app/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../core/app/loading.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../states/mobx/live_stream_store.dart';

class RoomWebViewPage extends StatelessWidget {
  const RoomWebViewPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    // late InAppWebViewController controller;
    print("https://tlk.li$id");
    final store = context.read<LiveStreamStore>();

    return Observer(
      builder: (_) {
        // Trigger UI
        if (store.deleteState == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.deleteState == BaseSate.error || store.errorMessage != null) {
          print(store.errorMessage ?? "Error");
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.dismissLoadingDialog(context);
            showDialog(
              context: context,
              builder: (_) => DefaultResultDialog(
                content:
                    store.errorMessage ?? LocaleKeys.serverUnexpectedError.tr(),
                isError: true,
              ),
            );
          });
        } else if (store.deleteState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              AppLoading.dismissLoadingDialog(context);
              GoRouter.of(context).pop();
              store.reInitDeleteLiveStreams();
            },
          );
        }

        return WillPopScope(
          onWillPop: () async {
            if (id.compareTo("/${GetIt.I<AppProvider>().user.id}") != 0) {
              print("Pop LiveStream room!!");
              return true;
            }
            print("Delete LiveStream room!!");
            store.deleteLiveStream();
            return false;
          },
          child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse("https://tlk.li$id"),
              ),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  mediaPlaybackRequiresUserGesture: false,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                controller = controller;
              },
              androidOnPermissionRequest: (InAppWebViewController controller,
                  String origin, List<String> resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              }
              // initialUrl: "https://7f1c-171-252-208-244.ngrok.io${widget.id}",
              // javascriptMode: JavascriptMode.unrestricted,
              // onWebViewCreated: (controller) {
              //   this.controller = controller;
              // },
              // initialMediaPlaybackPolicy:
              //     AutoMediaPlaybackPolicy.require_user_action_for_all_media_types,
              // onProgress: (progress) => log(progress.toString()),
              ),
        );
      },
    );
  }
}
