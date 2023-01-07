// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseDetailStore on _CourseDetailStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state =>
      (_$stateComputed ??= Computed<BaseSate>(() => super.state,
              name: '_CourseDetailStore.state'))
          .value;
  Computed<BaseSate>? _$joinStateComputed;

  @override
  BaseSate get joinState =>
      (_$joinStateComputed ??= Computed<BaseSate>(() => super.joinState,
              name: '_CourseDetailStore.joinState'))
          .value;

  late final _$courseDetailAtom =
      Atom(name: '_CourseDetailStore.courseDetail', context: context);

  @override
  CourseDetailModel? get courseDetail {
    _$courseDetailAtom.reportRead();
    return super.courseDetail;
  }

  @override
  set courseDetail(CourseDetailModel? value) {
    _$courseDetailAtom.reportWrite(value, super.courseDetail, () {
      super.courseDetail = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CourseDetailStore.errorMessage', context: context);

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

  late final _$userAtom =
      Atom(name: '_CourseDetailStore.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_courseFutureAtom =
      Atom(name: '_CourseDetailStore._courseFuture', context: context);

  @override
  ObservableFuture<Either<Failure, CourseDetailModel>>? get _courseFuture {
    _$_courseFutureAtom.reportRead();
    return super._courseFuture;
  }

  @override
  set _courseFuture(
      ObservableFuture<Either<Failure, CourseDetailModel>>? value) {
    _$_courseFutureAtom.reportWrite(value, super._courseFuture, () {
      super._courseFuture = value;
    });
  }

  late final _$_joinFutureAtom =
      Atom(name: '_CourseDetailStore._joinFuture', context: context);

  @override
  ObservableFuture<Either<Failure, UserModel>>? get _joinFuture {
    _$_joinFutureAtom.reportRead();
    return super._joinFuture;
  }

  @override
  set _joinFuture(ObservableFuture<Either<Failure, UserModel>>? value) {
    _$_joinFutureAtom.reportWrite(value, super._joinFuture, () {
      super._joinFuture = value;
    });
  }

  late final _$getCourseDetailAsyncAction =
      AsyncAction('_CourseDetailStore.getCourseDetail', context: context);

  @override
  Future<void> getCourseDetail(String courseId) {
    return _$getCourseDetailAsyncAction
        .run(() => super.getCourseDetail(courseId));
  }

  late final _$joinCourseAsyncAction =
      AsyncAction('_CourseDetailStore.joinCourse', context: context);

  @override
  Future<void> joinCourse(String userId, String courseId) {
    return _$joinCourseAsyncAction
        .run(() => super.joinCourse(userId, courseId));
  }

  @override
  String toString() {
    return '''
courseDetail: ${courseDetail},
errorMessage: ${errorMessage},
user: ${user},
state: ${state},
joinState: ${joinState}
    ''';
  }
}
