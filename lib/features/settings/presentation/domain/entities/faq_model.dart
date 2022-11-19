// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FAQModel extends Equatable {
  final String id;
  final String question;
  final String description;
  const FAQModel({
    required this.id,
    required this.question,
    required this.description,
  });

  FAQModel copyWith({
    String? id,
    String? question,
    String? description,
  }) {
    return FAQModel(
      id: id ?? this.id,
      question: question ?? this.question,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'description': description,
    };
  }

  factory FAQModel.fromMap(Map<String, dynamic> map) {
    return FAQModel(
      id: (map['id'] ?? '') as String,
      question: (map['question'] ?? '') as String,
      description: (map['description'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQModel.fromJson(String source) =>
      FAQModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, question, description];
}
