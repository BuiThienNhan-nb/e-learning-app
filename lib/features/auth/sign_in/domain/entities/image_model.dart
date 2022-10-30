// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final String url;
  final String blurHash;
  const ImageModel({
    required this.url,
    required this.blurHash,
  });

  @override
  List<Object> get props => [url, blurHash];

  ImageModel copyWith({
    String? url,
    String? blurHash,
  }) {
    return ImageModel(
      url: url ?? this.url,
      blurHash: blurHash ?? this.blurHash,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'blurHash': blurHash,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      url: (map['url'] ?? '') as String,
      blurHash: (map['blurHash'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
