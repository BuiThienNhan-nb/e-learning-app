// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CourseReviewModel extends Equatable {
  final String id;
  final String userId;
  final String courseId;
  final int rate;
  final String review;
  final DateTime reviewedAt;
  const CourseReviewModel({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.rate,
    required this.review,
    required this.reviewedAt,
  });

  CourseReviewModel copyWith({
    String? id,
    String? userId,
    String? courseId,
    int? rate,
    String? review,
    DateTime? reviewedAt,
  }) {
    return CourseReviewModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      courseId: courseId ?? this.courseId,
      rate: rate ?? this.rate,
      review: review ?? this.review,
      reviewedAt: reviewedAt ?? this.reviewedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'courseId': courseId,
      'rate': rate,
      'review': review,
      'reviewedAt': reviewedAt.millisecondsSinceEpoch,
    };
  }

  factory CourseReviewModel.fromMap(Map<String, dynamic> map) {
    return CourseReviewModel(
      id: (map['id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      courseId: (map['courseId'] ?? '') as String,
      rate: (map['rate'] ?? 0) as int,
      review: (map['review'] ?? '') as String,
      reviewedAt:
          DateTime.fromMillisecondsSinceEpoch((map['reviewedAt'] ?? 0) as int),
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
      rate,
      review,
      reviewedAt,
    ];
  }
}
