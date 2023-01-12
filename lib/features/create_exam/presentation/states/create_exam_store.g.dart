// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_exam_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateExamStore on _CreateExamStore, Store {
  Computed<BaseSate>? _$getStateComputed;

  @override
  BaseSate get getState =>
      (_$getStateComputed ??= Computed<BaseSate>(() => super.getState,
              name: '_CreateExamStore.getState'))
          .value;
  Computed<BaseSate>? _$createStateComputed;

  @override
  BaseSate get createState =>
      (_$createStateComputed ??= Computed<BaseSate>(() => super.createState,
              name: '_CreateExamStore.createState'))
          .value;

  late final _$examAtom = Atom(name: '_CreateExamStore.exam', context: context);

  @override
  ExamModel? get exam {
    _$examAtom.reportRead();
    return super.exam;
  }

  @override
  set exam(ExamModel? value) {
    _$examAtom.reportWrite(value, super.exam, () {
      super.exam = value;
    });
  }

  late final _$canCreateAtom =
      Atom(name: '_CreateExamStore.canCreate', context: context);

  @override
  bool get canCreate {
    _$canCreateAtom.reportRead();
    return super.canCreate;
  }

  @override
  set canCreate(bool value) {
    _$canCreateAtom.reportWrite(value, super.canCreate, () {
      super.canCreate = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CreateExamStore.errorMessage', context: context);

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

  late final _$_getExamFutureAtom =
      Atom(name: '_CreateExamStore._getExamFuture', context: context);

  @override
  ObservableFuture<Either<Failure, ExamModel?>>? get _getExamFuture {
    _$_getExamFutureAtom.reportRead();
    return super._getExamFuture;
  }

  @override
  set _getExamFuture(ObservableFuture<Either<Failure, ExamModel?>>? value) {
    _$_getExamFutureAtom.reportWrite(value, super._getExamFuture, () {
      super._getExamFuture = value;
    });
  }

  late final _$_createExamFutureAtom =
      Atom(name: '_CreateExamStore._createExamFuture', context: context);

  @override
  ObservableFuture<Either<Failure, ExamModel>>? get _createExamFuture {
    _$_createExamFutureAtom.reportRead();
    return super._createExamFuture;
  }

  @override
  set _createExamFuture(ObservableFuture<Either<Failure, ExamModel>>? value) {
    _$_createExamFutureAtom.reportWrite(value, super._createExamFuture, () {
      super._createExamFuture = value;
    });
  }

  late final _$getExamAsyncAction =
      AsyncAction('_CreateExamStore.getExam', context: context);

  @override
  Future<void> getExam(String lessonId, String lessonTitle) {
    return _$getExamAsyncAction.run(() => super.getExam(lessonId, lessonTitle));
  }

  late final _$createExamAsyncAction =
      AsyncAction('_CreateExamStore.createExam', context: context);

  @override
  Future<void> createExam(ExamModel examModel) {
    return _$createExamAsyncAction.run(() => super.createExam(examModel));
  }

  late final _$_CreateExamStoreActionController =
      ActionController(name: '_CreateExamStore', context: context);

  @override
  void reInitCreateState() {
    final _$actionInfo = _$_CreateExamStoreActionController.startAction(
        name: '_CreateExamStore.reInitCreateState');
    try {
      return super.reInitCreateState();
    } finally {
      _$_CreateExamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exam: ${exam},
canCreate: ${canCreate},
errorMessage: ${errorMessage},
getState: ${getState},
createState: ${createState}
    ''';
  }
}
