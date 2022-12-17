// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class LessonCommentModel extends Equatable {
  final String id;
  final String userId;
  String? userName;
  String? avatar;
  String content;
  final DateTime commentAt;
  LessonCommentModel({
    required this.id,
    required this.userId,
    this.userName,
    this.avatar,
    required this.content,
    required this.commentAt,
  });

  LessonCommentModel copyWith({
    String? id,
    String? userId,
    String? userName,
    String? avatar,
    String? content,
    DateTime? commentAt,
  }) {
    return LessonCommentModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      avatar: avatar ?? this.avatar,
      content: content ?? this.content,
      commentAt: commentAt ?? this.commentAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'username': userName,
      'avatar': avatar,
      'content': content,
      'image': "",
    };
  }

  factory LessonCommentModel.fromMap(Map<String, dynamic> map) {
    return LessonCommentModel(
      id: (map['commentId'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      userName: map['username'] != null ? map['username'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      content: (map['content'] ?? '') as String,
      commentAt: map['createdAt'] != null
          ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(map['createdAt'])
          : DateTime.now().add(const Duration(days: 1)),
      // DateTime.fromMillisecondsSinceEpoch((map['commentAt'] ?? 0) as int),
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
      userName ?? "",
      avatar ?? "",
      content,
      commentAt,
    ];
  }
}
