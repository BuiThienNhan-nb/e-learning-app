import 'package:e_learning_app/features/presenters/search/provider_search_presenter.dart';
import 'package:e_learning_app/features/presenters/search/search_state.dart';
import 'package:e_learning_app/features/search/domain/repositories/fetch_search_history.dart';
import 'package:e_learning_app/features/search/domain/repositories/save_search_history.dart';
import 'package:e_learning_app/features/search/presentation/search_presenter.dart';
import 'package:get_it/get_it.dart';

SearchPresenter makeSearchPresenter() => ProviderSearchPresenter(
      SearchState.initial(),
      GetIt.I<FetchSearchHistory>(),
      GetIt.I<SaveSearchHistory>(),
    );
