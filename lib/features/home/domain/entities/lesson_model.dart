// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'image_model.dart';

class LessonModel extends Equatable {
  String id;
  String title;
  String description;
  double rates;
  int votes;
  ImageModel image;
  String category;
  double price;
  double? sale;

  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.rates,
    required this.votes,
    required this.image,
    required this.category,
    required this.price,
    this.sale,
  });

  LessonModel copyWith({
    String? id,
    String? title,
    String? description,
    double? rates,
    int? votes,
    ImageModel? image,
    String? category,
    double? price,
    double? sale,
  }) {
    return LessonModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      rates: rates ?? this.rates,
      votes: votes ?? this.votes,
      image: image ?? this.image,
      category: category ?? this.category,
      price: price ?? this.price,
      sale: sale ?? this.sale,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'rates': rates,
      'votes': votes,
      'image': image.toMap(),
      'category': category,
      'price': price,
      'sale': sale,
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      id: (map['id'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      rates: (map['rates'] ?? 0.0) as double,
      votes: (map['votes'] ?? 0) as int,
      image: ImageModel.fromMap(map['image'] as Map<String, dynamic>),
      category: (map['category'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
      sale: map['sale'] != null ? map['sale'] as double : null,
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
      title,
      description,
      rates,
      votes,
      image,
      category,
      price,
      sale ?? 0.0,
    ];
  }
}
