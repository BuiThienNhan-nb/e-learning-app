// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeacherDetailStore on _TeacherDetailStore, Store {
  Computed<BaseSate>? _$getTeacherStateComputed;

  @override
  BaseSate get getTeacherState => (_$getTeacherStateComputed ??=
          Computed<BaseSate>(() => super.getTeacherState,
              name: '_TeacherDetailStore.getTeacherState'))
      .value;
  Computed<BaseSate>? _$getCourseStateComputed;

  @override
  BaseSate get getCourseState => (_$getCourseStateComputed ??=
          Computed<BaseSate>(() => super.getCourseState,
              name: '_TeacherDetailStore.getCourseState'))
      .value;

  late final _$teacherAtom =
      Atom(name: '_TeacherDetailStore.teacher', context: context);

  @override
  TeacherModel? get teacher {
    _$teacherAtom.reportRead();
    return super.teacher;
  }

  @override
  set teacher(TeacherModel? value) {
    _$teacherAtom.reportWrite(value, super.teacher, () {
      super.teacher = value;
    });
  }

  late final _$coursesAtom =
      Atom(name: '_TeacherDetailStore.courses', context: context);

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
      Atom(name: '_TeacherDetailStore.errorMessage', context: context);

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

  late final _$_getTeacherFutureAtom =
      Atom(name: '_TeacherDetailStore._getTeacherFuture', context: context);

  @override
  ObservableFuture<Either<Failure, TeacherModel>>? get _getTeacherFuture {
    _$_getTeacherFutureAtom.reportRead();
    return super._getTeacherFuture;
  }

  @override
  set _getTeacherFuture(
      ObservableFuture<Either<Failure, TeacherModel>>? value) {
    _$_getTeacherFutureAtom.reportWrite(value, super._getTeacherFuture, () {
      super._getTeacherFuture = value;
    });
  }

  late final _$_getCoursesFutureAtom =
      Atom(name: '_TeacherDetailStore._getCoursesFuture', context: context);

  @override
  ObservableFuture<Either<Failure, List<CourseModel>>>? get _getCoursesFuture {
    _$_getCoursesFutureAtom.reportRead();
    return super._getCoursesFuture;
  }

  @override
  set _getCoursesFuture(
      ObservableFuture<Either<Failure, List<CourseModel>>>? value) {
    _$_getCoursesFutureAtom.reportWrite(value, super._getCoursesFuture, () {
      super._getCoursesFuture = value;
    });
  }

  late final _$getTeacherByIdAsyncAction =
      AsyncAction('_TeacherDetailStore.getTeacherById', context: context);

  @override
  Future<void> getTeacherById(String teacherId) {
    return _$getTeacherByIdAsyncAction
        .run(() => super.getTeacherById(teacherId));
  }

  late final _$getTeacherCoursesAsyncAction =
      AsyncAction('_TeacherDetailStore.getTeacherCourses', context: context);

  @override
  Future<void> getTeacherCourses(String teacherId) {
    return _$getTeacherCoursesAsyncAction
        .run(() => super.getTeacherCourses(teacherId));
  }

  @override
  String toString() {
    return '''
teacher: ${teacher},
courses: ${courses},
errorMessage: ${errorMessage},
getTeacherState: ${getTeacherState},
getCourseState: ${getCourseState}
    ''';
  }
}
