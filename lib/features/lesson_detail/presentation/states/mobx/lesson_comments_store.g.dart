// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_comments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LessonCommentsStore on _LessonCommentsStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state =>
      (_$stateComputed ??= Computed<BaseSate>(() => super.state,
              name: '_LessonCommentsStore.state'))
          .value;

  late final _$commentsAtom =
      Atom(name: '_LessonCommentsStore.comments', context: context);

  @override
  List<LessonCommentModel>? get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(List<LessonCommentModel>? value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$socketCommentsAtom =
      Atom(name: '_LessonCommentsStore.socketComments', context: context);

  @override
  List<LessonCommentModel> get socketComments {
    _$socketCommentsAtom.reportRead();
    return super.socketComments;
  }

  @override
  set socketComments(List<LessonCommentModel> value) {
    _$socketCommentsAtom.reportWrite(value, super.socketComments, () {
      super.socketComments = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_LessonCommentsStore.errorMessage', context: context);

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

  late final _$_commentsFutureAtom =
      Atom(name: '_LessonCommentsStore._commentsFuture', context: context);

  @override
  ObservableFuture<Either<Failure, List<LessonCommentModel>>>?
      get _commentsFuture {
    _$_commentsFutureAtom.reportRead();
    return super._commentsFuture;
  }

  @override
  set _commentsFuture(
      ObservableFuture<Either<Failure, List<LessonCommentModel>>>? value) {
    _$_commentsFutureAtom.reportWrite(value, super._commentsFuture, () {
      super._commentsFuture = value;
    });
  }

  late final _$getLessonCommentsAsyncAction =
      AsyncAction('_LessonCommentsStore.getLessonComments', context: context);

  @override
  Future<void> getLessonComments(String lessonId) {
    return _$getLessonCommentsAsyncAction
        .run(() => super.getLessonComments(lessonId));
  }

  late final _$_LessonCommentsStoreActionController =
      ActionController(name: '_LessonCommentsStore', context: context);

  @override
  dynamic addComment(LessonCommentModel comment) {
    final _$actionInfo = _$_LessonCommentsStoreActionController.startAction(
        name: '_LessonCommentsStore.addComment');
    try {
      return super.addComment(comment);
    } finally {
      _$_LessonCommentsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
comments: ${comments},
socketComments: ${socketComments},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
