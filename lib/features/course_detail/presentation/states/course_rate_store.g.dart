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
  Computed<BaseSate>? _$getReviewsStateComputed;

  @override
  BaseSate get getReviewsState => (_$getReviewsStateComputed ??=
          Computed<BaseSate>(() => super.getReviewsState,
              name: '_CourseRateStore.getReviewsState'))
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

  late final _$reviewsAtom =
      Atom(name: '_CourseRateStore.reviews', context: context);

  @override
  List<CourseReviewModel>? get reviews {
    _$reviewsAtom.reportRead();
    return super.reviews;
  }

  @override
  set reviews(List<CourseReviewModel>? value) {
    _$reviewsAtom.reportWrite(value, super.reviews, () {
      super.reviews = value;
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

  late final _$_reviewsFutureAtom =
      Atom(name: '_CourseRateStore._reviewsFuture', context: context);

  @override
  ObservableFuture<Either<Failure, List<CourseReviewModel>>>?
      get _reviewsFuture {
    _$_reviewsFutureAtom.reportRead();
    return super._reviewsFuture;
  }

  @override
  set _reviewsFuture(
      ObservableFuture<Either<Failure, List<CourseReviewModel>>>? value) {
    _$_reviewsFutureAtom.reportWrite(value, super._reviewsFuture, () {
      super._reviewsFuture = value;
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
  Future<void> rateCourse(CourseReviewModel courseReviewModel) {
    return _$rateCourseAsyncAction
        .run(() => super.rateCourse(courseReviewModel));
  }

  late final _$getCourseReviewAsyncAction =
      AsyncAction('_CourseRateStore.getCourseReview', context: context);

  @override
  Future<void> getCourseReview(String courseId) {
    return _$getCourseReviewAsyncAction
        .run(() => super.getCourseReview(courseId));
  }

  late final _$_CourseRateStoreActionController =
      ActionController(name: '_CourseRateStore', context: context);

  @override
  void setCourseRate(double value) {
    final _$actionInfo = _$_CourseRateStoreActionController.startAction(
        name: '_CourseRateStore.setCourseRate');
    try {
      return super.setCourseRate(value);
    } finally {
      _$_CourseRateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCourseRateCount(int value) {
    final _$actionInfo = _$_CourseRateStoreActionController.startAction(
        name: '_CourseRateStore.setCourseRateCount');
    try {
      return super.setCourseRateCount(value);
    } finally {
      _$_CourseRateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCourseRate() {
    final _$actionInfo = _$_CourseRateStoreActionController.startAction(
        name: '_CourseRateStore.updateCourseRate');
    try {
      return super.updateCourseRate();
    } finally {
      _$_CourseRateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentRate: ${currentRate},
reviews: ${reviews},
errorMessage: ${errorMessage},
courseRate: ${courseRate},
courseRateCount: ${courseRateCount},
state: ${state},
getReviewsState: ${getReviewsState}
    ''';
  }
}
