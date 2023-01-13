// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

class CourseReviewModel extends Equatable {
  final String id;
  final String userId;
  final String courseId;
  int score;
  String comment;
  DateTime createdAt;

  CourseReviewModel({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.score,
    required this.comment,
    required this.createdAt,
  });

  CourseReviewModel copyWith({
    String? id,
    String? userId,
    String? courseId,
    int? score,
    String? comment,
    DateTime? createdAt,
  }) {
    return CourseReviewModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      courseId: courseId ?? this.courseId,
      score: score ?? this.score,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'rateId': id,
      'userId': userId,
      'courseId': courseId,
      'score': score,
      'comment': comment,
      // 'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory CourseReviewModel.fromMap(Map<String, dynamic> map) {
    return CourseReviewModel(
      id: (map['rateId'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      courseId: (map['courseId'] ?? '') as String,
      score: (map['score'] ?? 0) as int,
      comment: (map['comment'] ?? '') as String,
      createdAt: map['createdAt'] != null
          ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(map['createdAt'])
          : DateTime.now().add(const Duration(days: 1)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseReviewModel.fromJson(String source) =>
      CourseReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      userId,
      courseId,
      score,
      comment,
      createdAt,
    ];
  }
}
