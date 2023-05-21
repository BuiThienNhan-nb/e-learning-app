import 'package:shared_preferences/shared_preferences.dart';

class AppLocal {
  AppLocal._internal();

  static AppLocal instance = AppLocal._internal();

  late final SharedPreferences _sharedPreferences;
  SharedPreferences get sharedPreferences => _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
