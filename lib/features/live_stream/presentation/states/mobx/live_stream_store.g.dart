// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_stream_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LiveStreamStore on _LiveStreamStore, Store {
  Computed<BaseSate>? _$getStateComputed;

  @override
  BaseSate get getState =>
      (_$getStateComputed ??= Computed<BaseSate>(() => super.getState,
              name: '_LiveStreamStore.getState'))
          .value;
  Computed<BaseSate>? _$deleteStateComputed;

  @override
  BaseSate get deleteState =>
      (_$deleteStateComputed ??= Computed<BaseSate>(() => super.deleteState,
              name: '_LiveStreamStore.deleteState'))
          .value;
  Computed<BaseSate>? _$createStateComputed;

  @override
  BaseSate get createState =>
      (_$createStateComputed ??= Computed<BaseSate>(() => super.createState,
              name: '_LiveStreamStore.createState'))
          .value;

  late final _$liveStreamsAtom =
      Atom(name: '_LiveStreamStore.liveStreams', context: context);

  @override
  List<LiveStreamModel>? get liveStreams {
    _$liveStreamsAtom.reportRead();
    return super.liveStreams;
  }

  @override
  set liveStreams(List<LiveStreamModel>? value) {
    _$liveStreamsAtom.reportWrite(value, super.liveStreams, () {
      super.liveStreams = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_LiveStreamStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_liveStreamsFutureAtom =
      Atom(name: '_LiveStreamStore._liveStreamsFuture', context: context);

  @override
  ObservableFuture<Either<Failure, List<LiveStreamModel>>>?
      get _liveStreamsFuture {
    _$_liveStreamsFutureAtom.reportRead();
    return super._liveStreamsFuture;
  }

  @override
  set _liveStreamsFuture(
      ObservableFuture<Either<Failure, List<LiveStreamModel>>>? value) {
    _$_liveStreamsFutureAtom.reportWrite(value, super._liveStreamsFuture, () {
      super._liveStreamsFuture = value;
    });
  }

  late final _$_createLiveStreamsFutureAtom =
      Atom(name: '_LiveStreamStore._createLiveStreamsFuture', context: context);

  @override
  ObservableFuture<Either<Failure, LiveStreamModel>>?
      get _createLiveStreamsFuture {
    _$_createLiveStreamsFutureAtom.reportRead();
    return super._createLiveStreamsFuture;
  }

  @override
  set _createLiveStreamsFuture(
      ObservableFuture<Either<Failure, LiveStreamModel>>? value) {
    _$_createLiveStreamsFutureAtom
        .reportWrite(value, super._createLiveStreamsFuture, () {
      super._createLiveStreamsFuture = value;
    });
  }

  late final _$_deleteLiveStreamsFutureAtom =
      Atom(name: '_LiveStreamStore._deleteLiveStreamsFuture', context: context);

  @override
  ObservableFuture<Either<Failure, bool>>? get _deleteLiveStreamsFuture {
    _$_deleteLiveStreamsFutureAtom.reportRead();
    return super._deleteLiveStreamsFuture;
  }

  @override
  set _deleteLiveStreamsFuture(ObservableFuture<Either<Failure, bool>>? value) {
    _$_deleteLiveStreamsFutureAtom
        .reportWrite(value, super._deleteLiveStreamsFuture, () {
      super._deleteLiveStreamsFuture = value;
    });
  }

  late final _$getCurrentLiveStreamsAsyncAction =
      AsyncAction('_LiveStreamStore.getCurrentLiveStreams', context: context);

  @override
  Future<void> getCurrentLiveStreams() {
    return _$getCurrentLiveStreamsAsyncAction
        .run(() => super.getCurrentLiveStreams());
  }

  late final _$deleteLiveStreamAsyncAction =
      AsyncAction('_LiveStreamStore.deleteLiveStream', context: context);

  @override
  Future<void> deleteLiveStream() {
    return _$deleteLiveStreamAsyncAction.run(() => super.deleteLiveStream());
  }

  late final _$createLiveStreamAsyncAction =
      AsyncAction('_LiveStreamStore.createLiveStream', context: context);

  @override
  Future<void> createLiveStream() {
    return _$createLiveStreamAsyncAction.run(() => super.createLiveStream());
  }

  late final _$_LiveStreamStoreActionController =
      ActionController(name: '_LiveStreamStore', context: context);

  @override
  void reInitCreateLiveStreams() {
    final _$actionInfo = _$_LiveStreamStoreActionController.startAction(
        name: '_LiveStreamStore.reInitCreateLiveStreams');
    try {
      return super.reInitCreateLiveStreams();
    } finally {
      _$_LiveStreamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reInitDeleteLiveStreams() {
    final _$actionInfo = _$_LiveStreamStoreActionController.startAction(
        name: '_LiveStreamStore.reInitDeleteLiveStreams');
    try {
      return super.reInitDeleteLiveStreams();
    } finally {
      _$_LiveStreamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
liveStreams: ${liveStreams},
errorMessage: ${errorMessage},
getState: ${getState},
deleteState: ${deleteState},
createState: ${createState}
    ''';
  }
}
