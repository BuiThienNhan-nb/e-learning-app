import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../../configs/formats.dart';
import '../../../../../core/app/provider.dart';

@injectable
class SettingsPageProvider extends ChangeNotifier {
  final userValue = GetIt.I<AppProvider>().user;

  late final TextEditingController nameController =
      TextEditingController(text: userValue.name);
  late final TextEditingController passwordController =
      TextEditingController(text: userValue.email);
  late final TextEditingController datePickerController = TextEditingController(
    text: AppFormats.instance.formatDay.format(userValue.birthday),
  );
  late final TextEditingController phoneNumberController =
      TextEditingController(text: userValue.phoneNumber);
  int _genderIndex = GetIt.I<AppProvider>().user.gender == "ma"
      ? 0
      : GetIt.I<AppProvider>().user.gender == "fe"
          ? 1
          : 2;

  int get genderIndex => _genderIndex;

  set genderIndex(int value) {
    _genderIndex = value;
    notifyListeners();
  }

  final updateProfileKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    datePickerController.dispose();
    phoneNumberController.dispose();

    log("dispose settings_page_provider");

    super.dispose();
  }
}
