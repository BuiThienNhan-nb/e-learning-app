import 'dart:developer';

import 'package:e_learning_app/features/live_stream/presentation/widgets/current_live_stream_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/default_app_bar.dart';
import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../../core/app/loading.dart';
import '../../../../core/app/provider.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../states/mobx/live_stream_store.dart';

class LiveStreamPage extends StatelessWidget {
  const LiveStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final LiveStreamStore store = GetIt.I<LiveStreamStore>();

    return Observer(
      builder: (_) {
        // Trigger UI
        if (store.createState == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.createState == BaseSate.error || store.errorMessage != null) {
          log(store.errorMessage ?? "Error");
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
        } else if (store.createState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              AppLoading.dismissLoadingDialog(context);
              GoRouter.of(context).pushNamed(
                "live_stream",
                extra: store,
                params: {
                  "roomId": "/${GetIt.I<AppProvider>().user.id}",
                },
              );
              store.reInitCreateLiveStreams();
            },
          );
        }

        if (store.getState == BaseSate.init) {
          store.getCurrentLiveStreams();
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const DefaultAppBar(title: "Live Stream"),
          body: RefreshIndicator(
            onRefresh: () async {
              store.getCurrentLiveStreams();
              log("Refreshing...");
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.all(AppDimens.extraLargeWidthDimens),
                    padding: EdgeInsets.all(AppDimens.extraLargeWidthDimens),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.neutral.shade300),
                      borderRadius:
                          BorderRadius.circular(AppDimens.largeRadius),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.neutral.shade200,
                          blurRadius: AppDimens.mediumHeightDimens,
                          // offset: const Offset(1, 1),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 0.2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Join Live stream",
                          style: AppStyles.headline5TextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: AppDimens.largeHeightDimens),
                        DefaultTextFormField(
                          labelText: "",
                          controller: controller,
                          hintText: "Room id...",
                        ),
                        SizedBox(height: AppDimens.mediumHeightDimens),
                        DefaultTextButton(
                          submit: () => GoRouter.of(context).pushNamed(
                            "live_stream",
                            extra: store,
                            params: {
                              "roomId": "/${GetIt.I<AppProvider>().user.id}",
                            },
                          ),
                          // submit: () => pushLiveStreamBrowser(controller.text.trim()),
                          title: "Join live stream",
                          width: AppDimens.appDesignSize.width -
                              AppDimens.extraLargeWidthDimens * 6,
                          backgroundColor:
                              AppColors.primaryColor.withOpacity(0.2),
                          titleStyle: AppStyles.headline6TextStyle.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: AppDimens.mediumHeightDimens),
                        DefaultTextButton(
                          // submit: () => GoRouter.of(context).pushNamed(
                          //   "live_stream",
                          //   extra: "",
                          // ),
                          submit: () => store.createLiveStream(),
                          title: "Start Live stream",
                          width: AppDimens.appDesignSize.width -
                              AppDimens.extraLargeWidthDimens * 6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimens.largeHeightDimens),
                  Padding(
                    padding:
                        EdgeInsets.only(left: AppDimens.extraLargeWidthDimens),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "LiveStreaming...",
                        style: AppStyles.headline5TextStyle.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimens.largeHeightDimens),
                  store.getState == BaseSate.loaded
                      ? store.liveStreams!.isEmpty
                          ? IconButton(
                              onPressed: () {
                                store.getCurrentLiveStreams();
                              },
                              icon: Icon(
                                Icons.refresh_rounded,
                                size: AppDimens.extraLargeHeightDimens * 1.2,
                              ),
                            )
                          : ListView.builder(
                              itemCount: store.liveStreams!.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              primary: false,
                              itemBuilder: (context, index) =>
                                  CurrentLiveStreamWidget(
                                liveStream: store.liveStreams![index],
                                onJoinButtonClick: () {
                                  GoRouter.of(context).pushNamed(
                                    "live_stream",
                                    extra: store,
                                    params: {
                                      "roomId":
                                          "/${store.liveStreams![index].userId}",
                                    },
                                  );
                                },
                              ),
                            )
                      : SizedBox(
                          height: AppDimens.extraLargeHeightDimens * 6,
                          child: Center(
                            child: store.getState == BaseSate.loading
                                ? const LoadingWidget()
                                : Text(
                                    store.errorMessage ?? "Unexpected Error!!",
                                    style: AppStyles.subtitle1TextStyle,
                                  ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
