// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GoogleSearchModel extends Equatable {
  final String title;
  final String link;
  const GoogleSearchModel({
    required this.title,
    required this.link,
  });

  GoogleSearchModel copyWith({
    String? title,
    String? link,
  }) {
    return GoogleSearchModel(
      title: title ?? this.title,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'link': link,
    };
  }

  factory GoogleSearchModel.fromMap(Map<String, dynamic> map) {
    return GoogleSearchModel(
      title: (map['title'] ?? '') as String,
      link: (map['link'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleSearchModel.fromJson(String source) =>
      GoogleSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title, link];
}
