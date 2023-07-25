class AppConstants {
  AppConstants._internal();

  static AppConstants instance = AppConstants._internal();

  static const String emailUnVerify = "LOGIN.EMAIL_NOT_VERIFIED";

  /// Local key
  final String token = "TOKEN";
  final String userId = "USERID";
  final String searchHistory = "SEARCH_HISTORY";

  /// Design dimension
  static const double designHeight = 844;
  static const double designWidth = 390;

  static const String searchQuery = "education+news";
}
