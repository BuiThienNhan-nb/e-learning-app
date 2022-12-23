// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateCourseStore on _CreateCourseStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state =>
      (_$stateComputed ??= Computed<BaseSate>(() => super.state,
              name: '_CreateCourseStore.state'))
          .value;

  late final _$courseAtom =
      Atom(name: '_CreateCourseStore.course', context: context);

  @override
  CourseModel? get course {
    _$courseAtom.reportRead();
    return super.course;
  }

  @override
  set course(CourseModel? value) {
    _$courseAtom.reportWrite(value, super.course, () {
      super.course = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CreateCourseStore.errorMessage', context: context);

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

  late final _$_courseFutureAtom =
      Atom(name: '_CreateCourseStore._courseFuture', context: context);

  @override
  ObservableFuture<Either<Failure, CourseModel>>? get _courseFuture {
    _$_courseFutureAtom.reportRead();
    return super._courseFuture;
  }

  @override
  set _courseFuture(ObservableFuture<Either<Failure, CourseModel>>? value) {
    _$_courseFutureAtom.reportWrite(value, super._courseFuture, () {
      super._courseFuture = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: '_CreateCourseStore.controller', context: context);

  @override
  PageController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(PageController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$stepIndexAtom =
      Atom(name: '_CreateCourseStore.stepIndex', context: context);

  @override
  int get stepIndex {
    _$stepIndexAtom.reportRead();
    return super.stepIndex;
  }

  @override
  set stepIndex(int value) {
    _$stepIndexAtom.reportWrite(value, super.stepIndex, () {
      super.stepIndex = value;
    });
  }

  late final _$createCourseAsyncAction =
      AsyncAction('_CreateCourseStore.createCourse', context: context);

  @override
  Future<void> createCourse(CourseModel course) {
    return _$createCourseAsyncAction.run(() => super.createCourse(course));
  }

  late final _$_CreateCourseStoreActionController =
      ActionController(name: '_CreateCourseStore', context: context);

  @override
  void updateStepIndex(int value) {
    final _$actionInfo = _$_CreateCourseStoreActionController.startAction(
        name: '_CreateCourseStore.updateStepIndex');
    try {
      return super.updateStepIndex(value);
    } finally {
      _$_CreateCourseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
course: ${course},
errorMessage: ${errorMessage},
controller: ${controller},
stepIndex: ${stepIndex},
state: ${state}
    ''';
  }
}
