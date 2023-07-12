import 'package:e_learning_app/features/settings/presentation/widgets/update_avatar_bottom_sheet.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/styles.dart';
import '../../../teacher_detail/domain/usecases/teacher_detail_use_case.dart';
import '../../../teacher_detail/domain/usecases/teacher_detail_use_case/get_teacher_by_id.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/default_app_bar.dart';
import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/routes.dart';
import '../../../../core/app/loading.dart';
import '../../../../core/app/provider.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../states/mobx/payment_store.dart';
import '../states/mobx/update_avatar_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<UpdateAvatarStore>();
    final paymentStore = GetIt.I<PaymentStore>();

    List<Widget> buildListSettingsItems() => [
          SettingsItem(
            iconSource: "assets/icons/user_icon.png",
            title: "Edit Profile",
            onTap: () => GoRouter.of(context).pushNamed(
              "edit_profile",
              params: {
                "userId": GetIt.I<AppProvider>().user.id,
              },
            ),
          ),
          GetIt.I<AppProvider>().user.role == "teacher"
              ? SettingsItem(
                  iconSource: "assets/icons/my_course_inactive_icon.png",
                  title: "My Uploaded Course",
                  onTap: () => GoRouter.of(context).pushNamed("my_courses"),
                )
              : const SizedBox.shrink(),
          !GetIt.I<AppProvider>().user.isPremium
              ? SettingsItem(
                  iconSource: "assets/icons/credit_card_icon.png",
                  title: "To Premium",
                  onTap: () => paymentStore.getPaymentUrl(""),
                  // onTap: () => GoRouter.of(context).pushNamed("test_payment"),
                )
              : const SizedBox.shrink(),
          SettingsItem(
            iconSource: "assets/icons/notification_icon.png",
            title: "Notifications",
            onTap: () => GoRouter.of(context).pushNamed("notification"),
          ),
          SettingsItem(
            iconSource: "assets/icons/credit_card_icon.png",
            title: "Payment",
            onTap: () => GoRouter.of(context).pushNamed("payment"),
          ),
          SettingsItem(
            iconSource: "assets/icons/security_icon.png",
            title: "Security",
            onTap: () {},
          ),
          SettingsItem(
            iconSource: "assets/icons/three_dots_icon.png",
            title: "Language",
            onTap: () => GoRouter.of(context).pushNamed("language"),
          ),
          SettingsItem(
            iconSource: "assets/icons/lock_icon.png",
            title: "Privacy Policy",
            onTap: () => GoRouter.of(context).pushNamed("privacy_policy"),
          ),
          SettingsItem(
            iconSource: "assets/icons/help_center_icon.png",
            title: "Help Center",
            onTap: () => GoRouter.of(context).pushNamed("help_center"),
          ),
          SettingsItem(
            iconSource: "assets/icons/logout_icon.png",
            title: "Log out",
            onTap: () => GoRouter.of(context).go(GetIt.I<AppRoutes>().signIn),
            isLogOut: true,
          ),
        ];

    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppBar(title: "Profile"),
        body: Observer(
          builder: (_) {
            if (store.updateState == BaseSate.loading ||
                paymentStore.state == BaseSate.loading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.showLoadingDialog(context);
              });
            }
            if (store.updateState == BaseSate.error ||
                store.errorMessage != null) {
              print(store.errorMessage ?? "Error");
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.dismissLoadingDialog(context);
                showDialog(
                  context: context,
                  builder: (_) => DefaultResultDialog(
                    content: store.errorMessage ??
                        LocaleKeys.serverUnexpectedError.tr(),
                    isError: true,
                  ),
                );
              });
            } else if (store.updateState == BaseSate.loaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  AppLoading.dismissLoadingDialog(context);
                  // Navigator.of(context, rootNavigator: true).pop();
                  store.getAvatarDownloadUrl();
                },
              );
            }
            if (paymentStore.state == BaseSate.loaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  AppLoading.dismissLoadingDialog(context);
                  pushPaymentBrowser(paymentStore.paymentUrl!);
                },
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                final result =
                    await GetIt.I<TeacherDetailUseCase>().getTeacherById(
                  GetTeacherByIdParams(GetIt.I<AppProvider>().user.id),
                );
                result.fold(
                  (l) => print("Cannot get"),
                  (r) => GetIt.I<AppProvider>().user = r,
                );
                print("Refreshing...");
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Consumer<AppProvider>(
                  builder: (context, provider, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: AppDimens.largeHeightDimens),
                      GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          enableDrag: true,
                          useRootNavigator: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppDimens.itemRadius),
                              topRight: Radius.circular(AppDimens.itemRadius),
                            ),
                          ),
                          builder: (context) => UpdateAvatarBottomSheet(
                            store: store,
                          ),
                        ),
                        child: Container(
                          height: AppDimens.extraLargeHeightDimens * 4,
                          width: AppDimens.extraLargeWidthDimens * 4,
                          decoration: BoxDecoration(
                            color: GetIt.I<AppProvider>().user.avatar == null
                                ? AppColors.neutral.shade400
                                : AppColors.whiteColor,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.neutral.shade200),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.neutral.shade400,
                                blurRadius: AppDimens.mediumHeightDimens,
                                // offset: const Offset(1, 1),
                                blurStyle: BlurStyle.normal,
                                spreadRadius: 0.2,
                              ),
                            ],
                          ),
                          child: GetIt.I<AppProvider>().user.avatar == null
                              ? Center(
                                  child: Image.asset(
                                    "assets/icons/user_fill_icon.png",
                                    color: AppColors.whiteColor,
                                    fit: BoxFit.fill,
                                    height:
                                        AppDimens.extraLargeHeightDimens * 1.4,
                                    width:
                                        AppDimens.extraLargeWidthDimens * 1.4,
                                  ),
                                )
                              : DefaultNetworkImage(
                                  imageUrl:
                                      GetIt.I<AppProvider>().user.avatar ?? "",
                                  blurHash: "LKHBPW~BuPg\$.SI[%MxaKjM{\$*f8",
                                  height: AppDimens.extraLargeHeightDimens * 4,
                                  width: AppDimens.extraLargeWidthDimens * 4,
                                ),
                          // : FutureBuilder<String>(
                          //     future: store.getAvatarDownloadUrl(),
                          //     builder: (_, snapshot) {
                          //       if (snapshot.connectionState ==
                          //           ConnectionState.done) {
                          //         if (snapshot.hasError) {}

                          //         return DefaultNetworkImage(
                          //           imageUrl: snapshot.data ?? "",
                          //           blurHash:
                          //               "LKHBPW~BuPg\$.SI[%MxaKjM{\$*f8",
                          //           height:
                          //               AppDimens.extraLargeHeightDimens * 4,
                          //           width:
                          //               AppDimens.extraLargeWidthDimens * 4,
                          //         );
                          //       }
                          //       return const Center(
                          //         child: CircularProgressIndicator(),
                          //       );
                          //     },
                          //   ),
                        ),
                      ),
                      Text(
                        !GetIt.I<AppProvider>().user.isPremium
                            ? provider.user.name
                            : "${provider.user.name} 👑",
                        style: AppStyles.headline6TextStyle.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        provider.user.email,
                        style: AppStyles.subtitle1TextStyle,
                      ),
                      const Divider(
                        thickness: 1.2,
                      ),
                      Column(
                        children: buildListSettingsItems(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void pushPaymentBrowser(String url) {
    print(url);
    final MyInAppBrowser browser = MyInAppBrowser();
    // const String url =
    //     "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1000000&vnp_Command=pay&vnp_CreateDate=20221217133134&vnp_CurrCode=VND&vnp_ExpireDate=20221217143134&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=77da51a6-fae1-48ef-aee0-260100849e70&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A3000%2Fvnpay_return&vnp_TmnCode=LAXZGV5C&vnp_TxnRef=133134&vnp_Version=2.1.0&vnp_SecureHash=dc911bdf7e0b33fd362473d32795a880cbc85e0ee8ca058c2744fa12363dd292ec9a3479c4eb555785756296200458c8eb9f108770dcca74d0d09be7cd91c179";

    final settings = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
      ),
    );

    browser.openUrlRequest(
      urlRequest: URLRequest(
        url: Uri.parse(url),
      ),
      options: settings,
    );
  }
}

class SettingsItem extends StatelessWidget {
  SettingsItem({
    super.key,
    required this.iconSource,
    required this.title,
    required this.onTap,
    this.isLogOut = false,
  });

  final Function()? onTap;
  final String iconSource;
  final String title;
  bool? isLogOut = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(AppDimens.largeWidthDimens),
        padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              iconSource,
              color: isLogOut != null && isLogOut!
                  ? AppColors.fireEngineRedColor
                  : AppColors.blackColor,
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            Expanded(
              child: Text(
                title,
                style: AppStyles.subtitle1TextStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isLogOut != null && isLogOut!
                      ? AppColors.fireEngineRedColor
                      : AppColors.neutral.shade800,
                ),
              ),
            ),
            isLogOut != null && isLogOut!
                ? const SizedBox.shrink()
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.blackColor,
                  ),
          ],
        ),
      ),
    );
  }
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}
