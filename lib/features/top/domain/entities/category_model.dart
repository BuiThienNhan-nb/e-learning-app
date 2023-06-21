// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryModel extends Equatable {
  final String id;
  final String title;
  final Color color;
  final String? imageUrl;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.color,
    this.imageUrl,
  });

  CategoryModel copyWith({
    String? id,
    String? title,
    Color? color,
    String? imageUrl,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': color.value,
      'imageUrl': imageUrl,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: (map['id'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      color: Color((map['color'] ?? 0) as int),
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [id, title, color, imageUrl];
}
