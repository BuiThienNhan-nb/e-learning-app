// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateCourseStore on _UpdateCourseStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state =>
      (_$stateComputed ??= Computed<BaseSate>(() => super.state,
              name: '_UpdateCourseStore.state'))
          .value;
  Computed<BaseSate>? _$updateStateComputed;

  @override
  BaseSate get updateState =>
      (_$updateStateComputed ??= Computed<BaseSate>(() => super.updateState,
              name: '_UpdateCourseStore.updateState'))
          .value;
  Computed<BaseSate>? _$createSectionStateComputed;

  @override
  BaseSate get createSectionState => (_$createSectionStateComputed ??=
          Computed<BaseSate>(() => super.createSectionState,
              name: '_UpdateCourseStore.createSectionState'))
      .value;
  Computed<BaseSate>? _$updateSectionStateComputed;

  @override
  BaseSate get updateSectionState => (_$updateSectionStateComputed ??=
          Computed<BaseSate>(() => super.updateSectionState,
              name: '_UpdateCourseStore.updateSectionState'))
      .value;
  Computed<BaseSate>? _$deleteSectionStateComputed;

  @override
  BaseSate get deleteSectionState => (_$deleteSectionStateComputed ??=
          Computed<BaseSate>(() => super.deleteSectionState,
              name: '_UpdateCourseStore.deleteSectionState'))
      .value;

  late final _$courseDetailAtom =
      Atom(name: '_UpdateCourseStore.courseDetail', context: context);

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

  late final _$courseAtom =
      Atom(name: '_UpdateCourseStore.course', context: context);

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

  late final _$sectionAtom =
      Atom(name: '_UpdateCourseStore.section', context: context);

  @override
  SectionModel? get section {
    _$sectionAtom.reportRead();
    return super.section;
  }

  @override
  set section(SectionModel? value) {
    _$sectionAtom.reportWrite(value, super.section, () {
      super.section = value;
    });
  }

  late final _$sectionIndexAtom =
      Atom(name: '_UpdateCourseStore.sectionIndex', context: context);

  @override
  int? get sectionIndex {
    _$sectionIndexAtom.reportRead();
    return super.sectionIndex;
  }

  @override
  set sectionIndex(int? value) {
    _$sectionIndexAtom.reportWrite(value, super.sectionIndex, () {
      super.sectionIndex = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_UpdateCourseStore.errorMessage', context: context);

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
      Atom(name: '_UpdateCourseStore._courseFuture', context: context);

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

  late final _$_updateCourseFutureAtom =
      Atom(name: '_UpdateCourseStore._updateCourseFuture', context: context);

  @override
  ObservableFuture<Either<Failure, CourseModel>>? get _updateCourseFuture {
    _$_updateCourseFutureAtom.reportRead();
    return super._updateCourseFuture;
  }

  @override
  set _updateCourseFuture(
      ObservableFuture<Either<Failure, CourseModel>>? value) {
    _$_updateCourseFutureAtom.reportWrite(value, super._updateCourseFuture, () {
      super._updateCourseFuture = value;
    });
  }

  late final _$_createSectionFutureAtom =
      Atom(name: '_UpdateCourseStore._createSectionFuture', context: context);

  @override
  ObservableFuture<Either<Failure, SectionModel>>? get _createSectionFuture {
    _$_createSectionFutureAtom.reportRead();
    return super._createSectionFuture;
  }

  @override
  set _createSectionFuture(
      ObservableFuture<Either<Failure, SectionModel>>? value) {
    _$_createSectionFutureAtom.reportWrite(value, super._createSectionFuture,
        () {
      super._createSectionFuture = value;
    });
  }

  late final _$_updateSectionFutureAtom =
      Atom(name: '_UpdateCourseStore._updateSectionFuture', context: context);

  @override
  ObservableFuture<Either<Failure, SectionModel>>? get _updateSectionFuture {
    _$_updateSectionFutureAtom.reportRead();
    return super._updateSectionFuture;
  }

  @override
  set _updateSectionFuture(
      ObservableFuture<Either<Failure, SectionModel>>? value) {
    _$_updateSectionFutureAtom.reportWrite(value, super._updateSectionFuture,
        () {
      super._updateSectionFuture = value;
    });
  }

  late final _$_deleteSectionFutureAtom =
      Atom(name: '_UpdateCourseStore._deleteSectionFuture', context: context);

  @override
  ObservableFuture<Either<Failure, bool>>? get _deleteSectionFuture {
    _$_deleteSectionFutureAtom.reportRead();
    return super._deleteSectionFuture;
  }

  @override
  set _deleteSectionFuture(ObservableFuture<Either<Failure, bool>>? value) {
    _$_deleteSectionFutureAtom.reportWrite(value, super._deleteSectionFuture,
        () {
      super._deleteSectionFuture = value;
    });
  }

  late final _$getCourseDetailAsyncAction =
      AsyncAction('_UpdateCourseStore.getCourseDetail', context: context);

  @override
  Future<void> getCourseDetail(String courseId) {
    return _$getCourseDetailAsyncAction
        .run(() => super.getCourseDetail(courseId));
  }

  late final _$updateCourseInformationAsyncAction = AsyncAction(
      '_UpdateCourseStore.updateCourseInformation',
      context: context);

  @override
  Future<void> updateCourseInformation(CourseModel course, bool isUpdateImage) {
    return _$updateCourseInformationAsyncAction
        .run(() => super.updateCourseInformation(course, isUpdateImage));
  }

  late final _$createSectionAsyncAction =
      AsyncAction('_UpdateCourseStore.createSection', context: context);

  @override
  Future<void> createSection(SectionModel section, String courseId) {
    return _$createSectionAsyncAction
        .run(() => super.createSection(section, courseId));
  }

  late final _$updateSectionAsyncAction =
      AsyncAction('_UpdateCourseStore.updateSection', context: context);

  @override
  Future<void> updateSection(SectionModel section, String courseId) {
    return _$updateSectionAsyncAction
        .run(() => super.updateSection(section, courseId));
  }

  late final _$deleteSectionAsyncAction =
      AsyncAction('_UpdateCourseStore.deleteSection', context: context);

  @override
  Future<void> deleteSection(String sectionId, String courseId, int index) {
    return _$deleteSectionAsyncAction
        .run(() => super.deleteSection(sectionId, courseId, index));
  }

  late final _$_UpdateCourseStoreActionController =
      ActionController(name: '_UpdateCourseStore', context: context);

  @override
  void reInitCreateSection() {
    final _$actionInfo = _$_UpdateCourseStoreActionController.startAction(
        name: '_UpdateCourseStore.reInitCreateSection');
    try {
      return super.reInitCreateSection();
    } finally {
      _$_UpdateCourseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reInitDeleteSection() {
    final _$actionInfo = _$_UpdateCourseStoreActionController.startAction(
        name: '_UpdateCourseStore.reInitDeleteSection');
    try {
      return super.reInitDeleteSection();
    } finally {
      _$_UpdateCourseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
courseDetail: ${courseDetail},
course: ${course},
section: ${section},
sectionIndex: ${sectionIndex},
errorMessage: ${errorMessage},
state: ${state},
updateState: ${updateState},
createSectionState: ${createSectionState},
updateSectionState: ${updateSectionState},
deleteSectionState: ${deleteSectionState}
    ''';
  }
}
