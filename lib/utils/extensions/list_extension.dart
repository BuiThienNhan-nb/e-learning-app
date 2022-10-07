import 'package:easy_localization/easy_localization.dart';

extension SetLocaleExtension on List<String> {
  List<String> toCurrentLocale() {
    return map((e) => e.tr()).toList();
  }
}
