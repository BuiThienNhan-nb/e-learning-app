import '../../../../../../core/app/shared_preferences.dart';
import '../../../../../../utils/constants.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDataSource {
  Future setAccessToken(String accessToken);
  String? getAccessToken();
  Future setUserId(String userId);
  String? getUserId();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final _sharedPreferences = AppLocal.instance.sharedPreferences;

  @override
  Future setAccessToken(String accessToken) async {
    return await _sharedPreferences.setString(
        AppConstants.instance.token, accessToken);
  }

  @override
  String? getAccessToken() {
    return _sharedPreferences.getString(AppConstants.instance.token);
  }

  @override
  String? getUserId() {
    return _sharedPreferences.getString(AppConstants.instance.userId);
  }

  @override
  Future setUserId(String userId) async {
    return await _sharedPreferences.setString(
        AppConstants.instance.userId, userId); 
  }
}
