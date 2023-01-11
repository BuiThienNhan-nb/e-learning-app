// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  final String id;
  String title;
  List<String> options;
  String answer;

  QuestionModel({
    required this.id,
    required this.title,
    required this.options,
    required this.answer,
  });

  QuestionModel copyWith({
    String? id,
    String? title,
    List<String>? options,
    String? answer,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      options: options ?? this.options,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'options': options,
      'answer': answer,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: (map['id'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      options: List<String>.from(
          (map['options'] ?? const <String>[]) as List<String>),
      answer: (map['answer'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title, options, answer];
}
