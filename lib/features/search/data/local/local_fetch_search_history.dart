import 'package:e_learning_app/core/app/shared_preferences.dart';
import 'package:e_learning_app/features/search/domain/repositories/fetch_search_history.dart';
import 'package:e_learning_app/utils/constants.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FetchSearchHistory)
class LocalFetchSearchHistory implements FetchSearchHistory {
  final _sharedPreferences = AppLocal.instance.sharedPreferences;

  @override
  List<String> call() {
    try {
      final searchHistory =
          _sharedPreferences.getStringList(AppConstants.instance.searchHistory);

      return searchHistory ?? [];
    } catch (e) {
      throw Exception('Can not get search history with error: $e');
    }
  }
}
