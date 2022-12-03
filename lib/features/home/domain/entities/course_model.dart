// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:e_learning_app/features/home/domain/entities/section_model.dart';

import '../../../auth/sign_in/domain/entities/image_model.dart';

class CourseModel extends Equatable {
  final String id;
  String title;
  String description;
  double rates;
  int votes;
  ImageModel image;
  String category;
  double price;
  double? sale;
  List<SectionModel> section;
  bool haveCertificate;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.rates,
    required this.votes,
    required this.image,
    required this.category,
    required this.price,
    this.sale,
    required this.section,
    required this.haveCertificate,
  });

  CourseModel copyWith({
    String? id,
    String? title,
    String? description,
    double? rates,
    int? votes,
    ImageModel? image,
    String? category,
    double? price,
    double? sale,
    List<SectionModel>? section,
    bool? haveCertificate,
  }) {
    return CourseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      rates: rates ?? this.rates,
      votes: votes ?? this.votes,
      image: image ?? this.image,
      category: category ?? this.category,
      price: price ?? this.price,
      sale: sale ?? this.sale,
      section: section ?? this.section,
      haveCertificate: haveCertificate ?? this.haveCertificate,
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
      'section': section.map((x) => x.toMap()).toList(),
      'haveCertificate': haveCertificate,
    };
  }

  double totalCourseHours() {
    int total = 0;
    for (var section in section) {
      for (var lesson in section.lessons) {
        total += lesson.length ?? 0;
      }
    }
    return (total / 60);
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: (map['id'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      rates: (map['rates'] ?? 0.0) as double,
      votes: (map['votes'] ?? 0) as int,
      image: ImageModel.fromMap(map['image'] as Map<String, dynamic>),
      category: (map['category'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
      sale: map['sale'] != null ? map['sale'] as double : null,
      section: List<SectionModel>.from(
        (map['section'] as List<int>).map<SectionModel>(
          (x) => SectionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      haveCertificate: (map['haveCertificate'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
      sale ?? 0,
      section,
      haveCertificate,
    ];
  }
}
