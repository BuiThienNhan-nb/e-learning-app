// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:e_learning_app/features/home/domain/entities/lesson_model.dart';

class SectionModel extends Equatable {
  final String id;
  String title;
  List<LessonModel> lessons;

  SectionModel({
    required this.id,
    required this.title,
    required this.lessons,
  });

  SectionModel copyWith({
    String? id,
    String? title,
    List<LessonModel>? lessons,
  }) {
    return SectionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      lessons: lessons ?? this.lessons,
    );
  }

  Map<String, dynamic> toMap(int order) {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'order': order,
      'lessons': lessons.map((x) => x.toMap()).toList(),
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: (map['id'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      lessons: List<LessonModel>.from(
        (map['lessons'] as List<int>).map<LessonModel>(
          (x) => LessonModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap(0));

  factory SectionModel.fromJson(String source) =>
      SectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title, lessons];
}
