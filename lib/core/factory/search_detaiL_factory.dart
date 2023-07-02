import 'package:e_learning_app/features/presenters/search_detail/provider_search_detail_presenter.dart';
import 'package:e_learning_app/features/presenters/search_detail/search_detail_state.dart';
import 'package:e_learning_app/features/search_detail/search_detail_presenter.dart';

SearchDetailPresenter makeSearchDetailPresenter() =>
    ProviderSearchDetailPresenter(
      SearchDetailState.initial(),
    );
