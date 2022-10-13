import 'package:e_learning_app/generated/translations/locale_keys.g.dart';

extension DateTimeExtension on DateTime {
  String toGreetingString() {
    if (hour >= 0 && hour < 12) return LocaleKeys.goodMorning;

    if (hour >= 12 && hour < 7) return LocaleKeys.goodAfternoon;

    return LocaleKeys.goodNight;
  }
}
