// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_courses_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAllCoursesStore on _GetAllCoursesStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state =>
      (_$stateComputed ??= Computed<BaseSate>(() => super.state,
              name: '_GetAllCoursesStore.state'))
          .value;

  late final _$coursesAtom =
      Atom(name: '_GetAllCoursesStore.courses', context: context);

  @override
  List<CourseModel>? get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(List<CourseModel>? value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_GetAllCoursesStore.errorMessage', context: context);

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

  late final _$_coursesFutureAtom =
      Atom(name: '_GetAllCoursesStore._coursesFuture', context: context);

  @override
  ObservableFuture<Either<Failure, List<CourseModel>>>? get _coursesFuture {
    _$_coursesFutureAtom.reportRead();
    return super._coursesFuture;
  }

  @override
  set _coursesFuture(
      ObservableFuture<Either<Failure, List<CourseModel>>>? value) {
    _$_coursesFutureAtom.reportWrite(value, super._coursesFuture, () {
      super._coursesFuture = value;
    });
  }

  late final _$getAllCoursesAsyncAction =
      AsyncAction('_GetAllCoursesStore.getAllCourses', context: context);

  @override
  Future<void> getAllCourses() {
    return _$getAllCoursesAsyncAction.run(() => super.getAllCourses());
  }

  @override
  String toString() {
    return '''
courses: ${courses},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
