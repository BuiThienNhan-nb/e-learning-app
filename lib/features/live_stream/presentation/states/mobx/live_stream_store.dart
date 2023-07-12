import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/app/provider.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../domain/entities/live_stream_model.dart';
import '../../../domain/usecases/create_live_stream.dart';
import '../../../domain/usecases/delete_live_stream.dart';
import '../../../domain/usecases/live_stream_use_cases.dart';

part 'live_stream_store.g.dart';

@injectable
class LiveStreamStore extends _LiveStreamStore with _$LiveStreamStore {
  LiveStreamStore(super.useCases);
}

abstract class _LiveStreamStore with Store {
  final LiveStreamUseCases _useCases;

  _LiveStreamStore(this._useCases);

  @observable
  List<LiveStreamModel>? liveStreams;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, List<LiveStreamModel>>>? _liveStreamsFuture;
  @observable
  ObservableFuture<Either<Failure, LiveStreamModel>>? _createLiveStreamsFuture;
  @observable
  ObservableFuture<Either<Failure, bool>>? _deleteLiveStreamsFuture;

  @action
  void reInitCreateLiveStreams() {
    _createLiveStreamsFuture = null;
  }

  @action
  void reInitDeleteLiveStreams() {
    _deleteLiveStreamsFuture = null;
  }

  @computed
  BaseSate get getState {
    if (_liveStreamsFuture == null) {
      return BaseSate.init;
    }
    if (_liveStreamsFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _liveStreamsFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @computed
  BaseSate get deleteState {
    if (_deleteLiveStreamsFuture == null) {
      return BaseSate.init;
    }
    if (_deleteLiveStreamsFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _deleteLiveStreamsFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @computed
  BaseSate get createState {
    if (_createLiveStreamsFuture == null) {
      return BaseSate.init;
    }
    if (_createLiveStreamsFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _createLiveStreamsFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getCurrentLiveStreams() async {
    errorMessage = null;

    _liveStreamsFuture = ObservableFuture(
      _useCases.getCurrentLiveStream(
        NoParams(),
      ),
    );

    Either<Failure, List<LiveStreamModel>>? result = await _liveStreamsFuture;

    if (result == null) {
      errorMessage = LocaleKeys.serverUnexpectedError.tr();
      return;
    }

    return result.fold(
      (l) {
        (l is UserFailure || l is ServerFailure)
            ? errorMessage = l.message
            : errorMessage = LocaleKeys.serverUnexpectedError.tr();
      },
      (r) => liveStreams = r,
    );
  }

  @action
  Future<void> deleteLiveStream() async {
    errorMessage = null;

    _deleteLiveStreamsFuture = ObservableFuture(
      _useCases.deleteLiveStream(
        DeleteLiveStreamParams(
          GetIt.I<AppProvider>().user.id,
        ),
      ),
    );

    Either<Failure, bool>? result = await _deleteLiveStreamsFuture;

    if (result == null) {
      errorMessage = LocaleKeys.serverUnexpectedError.tr();
      return;
    }

    return result.fold(
      (l) {
        (l is UserFailure || l is ServerFailure)
            ? errorMessage = l.message
            : errorMessage = LocaleKeys.serverUnexpectedError.tr();
      },
      (r) {
        print("deleteLiveStream Success: $r");
      },
    );
  }

  @action
  Future<void> createLiveStream() async {
    errorMessage = null;

    _createLiveStreamsFuture = ObservableFuture(
      _useCases.createLiveStream(
        CreateLiveStreamParams(
          LiveStreamModel(
            id: "id",
            userId: GetIt.I<AppProvider>().user.id,
            userName: GetIt.I<AppProvider>().user.name,
          ),
        ),
      ),
    );

    Either<Failure, LiveStreamModel>? result = await _createLiveStreamsFuture;

    if (result == null) {
      errorMessage = LocaleKeys.serverUnexpectedError.tr();
      return;
    }

    return result.fold(
      (l) {
        (l is UserFailure || l is ServerFailure)
            ? errorMessage = l.message
            : errorMessage = LocaleKeys.serverUnexpectedError.tr();
      },
      (r) {
        print("createLiveStream Success: $r");
      },
    );
  }
}
