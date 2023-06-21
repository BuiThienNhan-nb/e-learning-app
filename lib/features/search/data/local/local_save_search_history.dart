import 'package:e_learning_app/core/app/shared_preferences.dart';
import 'package:e_learning_app/features/search/domain/repositories/save_search_history.dart';
import 'package:e_learning_app/utils/constants.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SaveSearchHistory)
class LocalSaveSearchHistory implements SaveSearchHistory {
  final _sharedPreferences = AppLocal.instance.sharedPreferences;

  @override
  Future<void> call(List<String> searchHistory) async {
    try {
      await _sharedPreferences.setStringList(
          AppConstants.instance.searchHistory, searchHistory);
    } catch (e) {
      throw Exception('Cannot save search history with error: $e');
    }
  }
}
