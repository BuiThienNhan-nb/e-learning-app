// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'do_exam_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DoExamStore on _DoExamStore, Store {
  Computed<BaseSate>? _$getStateComputed;

  @override
  BaseSate get getState =>
      (_$getStateComputed ??= Computed<BaseSate>(() => super.getState,
              name: '_DoExamStore.getState'))
          .value;

  late final _$examAtom = Atom(name: '_DoExamStore.exam', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_DoExamStore.errorMessage', context: context);

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
      Atom(name: '_DoExamStore._getExamFuture', context: context);

  @override
  ObservableFuture<Either<Failure, ExamModel>>? get _getExamFuture {
    _$_getExamFutureAtom.reportRead();
    return super._getExamFuture;
  }

  @override
  set _getExamFuture(ObservableFuture<Either<Failure, ExamModel>>? value) {
    _$_getExamFutureAtom.reportWrite(value, super._getExamFuture, () {
      super._getExamFuture = value;
    });
  }

  late final _$getExamAsyncAction =
      AsyncAction('_DoExamStore.getExam', context: context);

  @override
  Future<void> getExam(String lessonId) {
    return _$getExamAsyncAction.run(() => super.getExam(lessonId));
  }

  @override
  String toString() {
    return '''
exam: ${exam},
errorMessage: ${errorMessage},
getState: ${getState}
    ''';
  }
}
