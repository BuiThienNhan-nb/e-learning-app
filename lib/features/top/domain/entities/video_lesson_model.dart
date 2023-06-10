// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideoLessonModel extends Equatable {
  final String id;
  String videoUrl;
  int length;

  VideoLessonModel({
    required this.id,
    required this.videoUrl,
    required this.length,
  });

  VideoLessonModel copyWith({
    String? id,
    String? videoUrl,
    int? length,
  }) {
    return VideoLessonModel(
      id: id ?? this.id,
      videoUrl: videoUrl ?? this.videoUrl,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'videoUrl': videoUrl,
      'length': length,
    };
  }

  factory VideoLessonModel.fromMap(Map<String, dynamic> map) {
    return VideoLessonModel(
      id: (map['id'] ?? '') as String,
      videoUrl: (map['videoUrl'] ?? '') as String,
      length: (map['length'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoLessonModel.fromJson(String source) =>
      VideoLessonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, videoUrl, length];
}
