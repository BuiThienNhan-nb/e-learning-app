// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'video_lesson_model.dart';

class LessonModel extends Equatable {
  final String id;
  int order;
  String title;
  VideoLessonModel? video;

  LessonModel({
    required this.id,
    required this.order,
    required this.title,
    this.video,
  });

  LessonModel copyWith({
    String? id,
    int? order,
    String? title,
    VideoLessonModel? video,
  }) {
    return LessonModel(
      id: id ?? this.id,
      order: order ?? this.order,
      title: title ?? this.title,
      video: video ?? this.video,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'title': title,
      'video': video?.toMap(),
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      id: (map['id'] ?? '') as String,
      order: (map['order'] ?? 0) as int,
      title: (map['title'] ?? '') as String,
      video: map['video'] != null
          ? VideoLessonModel.fromMap(map['video'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonModel.fromJson(String source) =>
      LessonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        order,
        title,
        video ??
            VideoLessonModel(
              id: "id_null",
              videoUrl: "url_null",
              length: 0,
            ),
      ];
}
