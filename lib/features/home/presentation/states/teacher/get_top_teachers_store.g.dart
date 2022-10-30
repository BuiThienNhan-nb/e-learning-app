// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_top_teachers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetTopTeachersStore on _GetTopTeachersStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state =>
      (_$stateComputed ??= Computed<BaseSate>(() => super.state,
              name: '_GetTopTeachersStore.state'))
          .value;

  late final _$topTeachersAtom =
      Atom(name: '_GetTopTeachersStore.topTeachers', context: context);

  @override
  List<TeacherModel>? get topTeachers {
    _$topTeachersAtom.reportRead();
    return super.topTeachers;
  }

  @override
  set topTeachers(List<TeacherModel>? value) {
    _$topTeachersAtom.reportWrite(value, super.topTeachers, () {
      super.topTeachers = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_GetTopTeachersStore.errorMessage', context: context);

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

  late final _$_topTeachersFutureAtom =
      Atom(name: '_GetTopTeachersStore._topTeachersFuture', context: context);

  @override
  ObservableFuture<Either<Failure, List<TeacherModel>>>?
      get _topTeachersFuture {
    _$_topTeachersFutureAtom.reportRead();
    return super._topTeachersFuture;
  }

  @override
  set _topTeachersFuture(
      ObservableFuture<Either<Failure, List<TeacherModel>>>? value) {
    _$_topTeachersFutureAtom.reportWrite(value, super._topTeachersFuture, () {
      super._topTeachersFuture = value;
    });
  }

  late final _$getTopTeachersAsyncAction =
      AsyncAction('_GetTopTeachersStore.getTopTeachers', context: context);

  @override
  Future<void> getTopTeachers() {
    return _$getTopTeachersAsyncAction.run(() => super.getTopTeachers());
  }

  @override
  String toString() {
    return '''
topTeachers: ${topTeachers},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
