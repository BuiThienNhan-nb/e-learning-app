// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:e_learning_app/features/home/domain/entities/lesson_model.dart';

class SectionModel extends Equatable {
  final String id;
  String title;
  List<LessonModel> lessons;
  int order;

  SectionModel({
    required this.id,
    required this.title,
    required this.lessons,
    required this.order,
  });

  SectionModel copyWith({
    String? id,
    String? title,
    List<LessonModel>? lessons,
    int? order,
  }) {
    return SectionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      lessons: lessons ?? this.lessons,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'title': title,
      'order': order,
      'lessons': lessons.map((x) => x.toMap()).toList(),
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: (map['sectionId'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      lessons: List<LessonModel>.from(
        (map['lessons'] as List).map<LessonModel>(
          (x) => LessonModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      order: (map['order'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionModel.fromJson(String source) =>
      SectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title, lessons];
}
