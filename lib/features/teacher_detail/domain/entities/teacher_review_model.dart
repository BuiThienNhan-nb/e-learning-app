import 'dart:convert';

import 'package:e_learning_app/features/course_detail/domain/entities/review_model.dart';

class TeacherReviewModel extends ReviewModel {
  final String teacherId;

  const TeacherReviewModel({
    required super.id,
    required super.userId,
    required super.rate,
    required super.review,
    required super.reviewedAt,
    required this.teacherId,
  });

  @override
  TeacherReviewModel copyWith({
    String? id,
    String? userId,
    int? rate,
    String? review,
    DateTime? reviewedAt,
    String? teacherId,
  }) {
    return TeacherReviewModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      rate: rate ?? this.rate,
      review: review ?? this.review,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      teacherId: teacherId ?? this.teacherId,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'rate': rate,
      'review': review,
      'reviewedAt': reviewedAt.millisecondsSinceEpoch,
      'teacherId': teacherId,
    };
  }

  factory TeacherReviewModel.fromMap(Map<String, dynamic> map) {
    return TeacherReviewModel(
      id: (map['id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      rate: (map['rate'] ?? 0) as int,
      review: (map['review'] ?? '') as String,
      reviewedAt:
          DateTime.fromMillisecondsSinceEpoch((map['reviewedAt'] ?? 0) as int),
      teacherId: (map['teacherId'] ?? '') as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory TeacherReviewModel.fromJson(String source) =>
      TeacherReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      userId,
      rate,
      review,
      reviewedAt,
      teacherId,
    ];
  }
}
