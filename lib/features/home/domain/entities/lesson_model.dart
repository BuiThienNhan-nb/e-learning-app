// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LessonModel extends Equatable {
  final String id;
  int order;
  String title;
  String? videoUrl;
  int? length;

  LessonModel({
    required this.id,
    required this.order,
    required this.title,
    this.videoUrl,
    this.length,
  });

  LessonModel copyWith({
    String? id,
    int? order,
    String? title,
    String? videoUrl,
    int? length,
  }) {
    return LessonModel(
      id: id ?? this.id,
      order: order ?? this.order,
      title: title ?? this.title,
      videoUrl: videoUrl ?? this.videoUrl,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'title': title,
      'videoUrl': videoUrl,
      'length': length,
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      id: (map['id'] ?? '') as String,
      order: (map['order'] ?? 0) as int,
      title: (map['title'] ?? '') as String,
      videoUrl: map['videoUrl'] != null ? map['videoUrl'] as String : null,
      length: map['length'] != null ? map['length'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonModel.fromJson(String source) =>
      LessonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      order,
      title,
      videoUrl ?? "",
      length ?? 0,
    ];
  }
}
