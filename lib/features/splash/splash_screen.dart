import 'package:e_learning_app/core/app/provider.dart';

import '../auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import '../auth/sign_in/domain/usecases/auth_use_case.dart';
import '../auth/sign_in/domain/usecases/auth_use_case/get_user_by_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../configs/colors.dart';
import '../../configs/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future appRouting() async {
    final local = GetIt.I<AuthLocalDataSource>();
    final useCase = GetIt.I<AuthUseCase>();

    if (local.getAccessToken() == null || local.getAccessToken()!.isEmpty) {
      // navigate(GetIt.I<AppRoutes>().signIn);
      return WidgetsBinding.instance.addPostFrameCallback((_) {
        GoRouter.of(context).go(GetIt.I<AppRoutes>().signIn);
      });
    }

    try {
      final data = await useCase.getUserUseCase.call(
        GetUserByIdParams(
          local.getUserId() ?? "",
        ),
      );
      data.fold(
        (l) => throw Exception(l.message),
        (r) => GetIt.I<AppProvider>().user = r,
      );
      navigate(GetIt.I<AppRoutes>().mainPage);
    } catch (e) {
      print(e);
      navigate(GetIt.I<AppRoutes>().signIn);
    }
  }

  void navigate(String pathName) {
    if (!mounted) return;
    GoRouter.of(context).go(pathName);
  }

  @override
  void initState() {
    super.initState();
    appRouting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColors.whiteColor,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/app_logo.svg",
              alignment: Alignment.center,
              color: AppColors.appColorBlue,
            ),
          ),
        ],
      ),
    );
  }
}
