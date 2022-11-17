// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LessonLastPlayModel extends Equatable {
  final String id;
  final String userId;
  final String lessonId;
  int lastPosition;

  LessonLastPlayModel({
    required this.id,
    required this.userId,
    required this.lessonId,
    required this.lastPosition,
  });

  LessonLastPlayModel copyWith({
    String? id,
    String? userId,
    String? lessonId,
    int? lastPosition,
  }) {
    return LessonLastPlayModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      lessonId: lessonId ?? this.lessonId,
      lastPosition: lastPosition ?? this.lastPosition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'lessonId': lessonId,
      'lastPosition': lastPosition,
    };
  }

  factory LessonLastPlayModel.fromMap(Map<String, dynamic> map) {
    return LessonLastPlayModel(
      id: (map['id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      lessonId: (map['lessonId'] ?? '') as String,
      lastPosition: (map['lastPosition'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonLastPlayModel.fromJson(String source) =>
      LessonLastPlayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, userId, lessonId, lastPosition];
}
