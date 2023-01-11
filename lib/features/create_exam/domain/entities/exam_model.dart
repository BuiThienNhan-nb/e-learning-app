// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_learning_app/features/create_exam/domain/entities/question_model.dart';
import 'package:equatable/equatable.dart';

class ExamModel extends Equatable {
  final String lessonId;
  final String lessonTitle;
  final String examTitle;
  final String userId;
  int time;
  List<QuestionModel> questions;

  ExamModel({
    required this.lessonId,
    required this.lessonTitle,
    required this.examTitle,
    required this.userId,
    required this.time,
    required this.questions,
  });

  ExamModel copyWith({
    String? lessonId,
    String? lessonTitle,
    String? examTitle,
    String? userId,
    int? time,
    List<QuestionModel>? questions,
  }) {
    return ExamModel(
      lessonId: lessonId ?? this.lessonId,
      lessonTitle: lessonTitle ?? this.lessonTitle,
      examTitle: examTitle ?? this.examTitle,
      userId: userId ?? this.userId,
      time: time ?? this.time,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lessonId': lessonId,
      'lessonTitle': lessonTitle,
      'examTitle': examTitle,
      'userId': userId,
      'time': time,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory ExamModel.fromMap(Map<String, dynamic> map) {
    return ExamModel(
      lessonId: (map['lessonId'] ?? '') as String,
      lessonTitle: (map['lessonTitle'] ?? '') as String,
      examTitle: (map['examTitle'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      time: (map['time'] ?? 0) as int,
      questions: List<QuestionModel>.from(
        (map['questions'] as List<int>).map<QuestionModel>(
          (x) => QuestionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamModel.fromJson(String source) =>
      ExamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      lessonId,
      lessonTitle,
      examTitle,
      userId,
      time,
      questions,
    ];
  }
}
