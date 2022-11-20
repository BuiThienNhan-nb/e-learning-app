// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String id;
  final String userId;
  final int rate;
  final String review;
  final DateTime reviewedAt;

  const ReviewModel({
    required this.id,
    required this.userId,
    required this.rate,
    required this.review,
    required this.reviewedAt,
  });

  ReviewModel copyWith({
    String? id,
    String? userId,
    int? rate,
    String? review,
    DateTime? reviewedAt,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      rate: rate ?? this.rate,
      review: review ?? this.review,
      reviewedAt: reviewedAt ?? this.reviewedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'rate': rate,
      'review': review,
      'reviewedAt': reviewedAt.millisecondsSinceEpoch,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: (map['id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      rate: (map['rate'] ?? 0) as int,
      review: (map['review'] ?? '') as String,
      reviewedAt:
          DateTime.fromMillisecondsSinceEpoch((map['reviewedAt'] ?? 0) as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
    ];
  }
}
