// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_rate_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseRateStore on _CourseRateStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state => (_$stateComputed ??=
          Computed<BaseSate>(() => super.state, name: '_CourseRateStore.state'))
      .value;

  late final _$currentRateAtom =
      Atom(name: '_CourseRateStore.currentRate', context: context);

  @override
  int? get currentRate {
    _$currentRateAtom.reportRead();
    return super.currentRate;
  }

  @override
  set currentRate(int? value) {
    _$currentRateAtom.reportWrite(value, super.currentRate, () {
      super.currentRate = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CourseRateStore.errorMessage', context: context);

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

  late final _$courseRateAtom =
      Atom(name: '_CourseRateStore.courseRate', context: context);

  @override
  double get courseRate {
    _$courseRateAtom.reportRead();
    return super.courseRate;
  }

  @override
  set courseRate(double value) {
    _$courseRateAtom.reportWrite(value, super.courseRate, () {
      super.courseRate = value;
    });
  }

  late final _$courseRateCountAtom =
      Atom(name: '_CourseRateStore.courseRateCount', context: context);

  @override
  int get courseRateCount {
    _$courseRateCountAtom.reportRead();
    return super.courseRateCount;
  }

  @override
  set courseRateCount(int value) {
    _$courseRateCountAtom.reportWrite(value, super.courseRateCount, () {
      super.courseRateCount = value;
    });
  }

  late final _$_currentRateFutureAtom =
      Atom(name: '_CourseRateStore._currentRateFuture', context: context);

  @override
  ObservableFuture<Either<Failure, int?>>? get _currentRateFuture {
    _$_currentRateFutureAtom.reportRead();
    return super._currentRateFuture;
  }

  @override
  set _currentRateFuture(ObservableFuture<Either<Failure, int?>>? value) {
    _$_currentRateFutureAtom.reportWrite(value, super._currentRateFuture, () {
      super._currentRateFuture = value;
    });
  }

  late final _$getCourseRateAsyncAction =
      AsyncAction('_CourseRateStore.getCourseRate', context: context);

  @override
  Future<void> getCourseRate(String courseId) {
    return _$getCourseRateAsyncAction.run(() => super.getCourseRate(courseId));
  }

  late final _$rateCourseAsyncAction =
      AsyncAction('_CourseRateStore.rateCourse', context: context);

  @override
  Future<void> rateCourse(String courseId, int score) {
    return _$rateCourseAsyncAction.run(() => super.rateCourse(courseId, score));
  }

  @override
  String toString() {
    return '''
currentRate: ${currentRate},
errorMessage: ${errorMessage},
courseRate: ${courseRate},
courseRateCount: ${courseRateCount},
state: ${state}
    ''';
  }
}
