// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class VisualModel extends Equatable {
  final String courseId;
  final String imageUrl;
  const VisualModel({
    required this.courseId,
    required this.imageUrl,
  });

  VisualModel copyWith({
    String? courseId,
    String? imageUrl,
  }) {
    return VisualModel(
      courseId: courseId ?? this.courseId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseId': courseId,
      'imageUrl': imageUrl,
    };
  }

  factory VisualModel.fromMap(Map<String, dynamic> map) {
    return VisualModel(
      courseId: (map['courseId'] ?? '') as String,
      imageUrl: (map['imageUrl'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VisualModel.fromJson(String source) =>
      VisualModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [courseId, imageUrl];
}
