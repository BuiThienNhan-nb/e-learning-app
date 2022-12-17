// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_rcm_courses_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetRecommendedCoursesStore on _GetRecommendedCoursesStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state =>
      (_$stateComputed ??= Computed<BaseSate>(() => super.state,
              name: '_GetRecommendedCoursesStore.state'))
          .value;

  late final _$recommendedLessonsAtom = Atom(
      name: '_GetRecommendedCoursesStore.recommendedLessons', context: context);

  @override
  List<CourseModel>? get recommendedLessons {
    _$recommendedLessonsAtom.reportRead();
    return super.recommendedLessons;
  }

  @override
  set recommendedLessons(List<CourseModel>? value) {
    _$recommendedLessonsAtom.reportWrite(value, super.recommendedLessons, () {
      super.recommendedLessons = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_GetRecommendedCoursesStore.errorMessage', context: context);

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

  late final _$_recommendedLessonsFutureAtom = Atom(
      name: '_GetRecommendedCoursesStore._recommendedLessonsFuture',
      context: context);

  @override
  ObservableFuture<Either<Failure, List<CourseModel>>>?
      get _recommendedLessonsFuture {
    _$_recommendedLessonsFutureAtom.reportRead();
    return super._recommendedLessonsFuture;
  }

  @override
  set _recommendedLessonsFuture(
      ObservableFuture<Either<Failure, List<CourseModel>>>? value) {
    _$_recommendedLessonsFutureAtom
        .reportWrite(value, super._recommendedLessonsFuture, () {
      super._recommendedLessonsFuture = value;
    });
  }

  late final _$getRecommendedLessonsAsyncAction = AsyncAction(
      '_GetRecommendedCoursesStore.getRecommendedLessons',
      context: context);

  @override
  Future<void> getRecommendedLessons() {
    return _$getRecommendedLessonsAsyncAction
        .run(() => super.getRecommendedLessons());
  }

  @override
  String toString() {
    return '''
recommendedLessons: ${recommendedLessons},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
