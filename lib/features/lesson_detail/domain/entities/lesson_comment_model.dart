// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class LessonCommentModel extends Equatable {
  final String id;
  final String userId;
  final String? commentParentId;
  List<String> childCommentIds;
  final String lessonId;
  String comment;
  final DateTime commentAt;

  LessonCommentModel({
    required this.id,
    required this.userId,
    this.commentParentId,
    required this.childCommentIds,
    required this.lessonId,
    required this.comment,
    required this.commentAt,
  }) : assert(
          !(commentParentId != null && childCommentIds.isNotEmpty),
          "This Comment cannot be parent and child at the same time!!!",
        );

  LessonCommentModel copyWith({
    String? id,
    String? userId,
    String? commentParentId,
    List<String>? childCommentIds,
    String? lessonId,
    String? comment,
    DateTime? commentAt,
  }) {
    return LessonCommentModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      commentParentId: commentParentId ?? this.commentParentId,
      childCommentIds: childCommentIds ?? this.childCommentIds,
      lessonId: lessonId ?? this.lessonId,
      comment: comment ?? this.comment,
      commentAt: commentAt ?? this.commentAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'commentParentId': commentParentId,
      'childCommentIds': childCommentIds,
      'lessonId': lessonId,
      'comment': comment,
      'commentAt': commentAt.millisecondsSinceEpoch,
    };
  }

  factory LessonCommentModel.fromMap(Map<String, dynamic> map) {
    return LessonCommentModel(
      id: (map['id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      commentParentId: map['commentParentId'] != null
          ? map['commentParentId'] as String
          : null,
      childCommentIds: List<String>.from(
          (map['childCommentIds'] ?? const <String>[]) as List<String>),
      lessonId: (map['lessonId'] ?? '') as String,
      comment: (map['comment'] ?? '') as String,
      commentAt:
          DateTime.fromMillisecondsSinceEpoch((map['commentAt'] ?? 0) as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonCommentModel.fromJson(String source) =>
      LessonCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      userId,
      commentParentId ?? "",
      childCommentIds,
      lessonId,
      comment,
      commentAt,
    ];
  }
}
