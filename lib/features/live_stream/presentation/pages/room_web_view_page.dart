import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RoomWebViewPage extends StatefulWidget {
  RoomWebViewPage({
    super.key,
    this.id = "",
  });

  String id = "";

  @override
  State<RoomWebViewPage> createState() => _RoomWebViewPageState();
}

class _RoomWebViewPageState extends State<RoomWebViewPage> {
  late InAppWebViewController controller;

  @override
  Widget build(BuildContext context) {
    log("https://a190-171-252-208-244.ngrok.io${widget.id}");

    return SafeArea(
      child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse("https://a190-171-252-208-244.ngrok.io${widget.id}"),
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
  }
}
