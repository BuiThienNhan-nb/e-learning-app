// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:e_learning_app/features/auth/sign_in/domain/entities/user_info.dart';

import 'image_model.dart';

class TeacherModel extends UserInfo {
  final double rates;
  final int votes;

  TeacherModel({
    required super.id,
    required super.name,
    required super.email,
    required super.birthday,
    required super.role,
    required super.gender,
    required super.avatar,
    required super.phoneNumber,
    required this.rates,
    required this.votes,
  });

  @override
  TeacherModel copyWith({
    String? id,
    String? name,
    String? email,
    ImageModel? avatar,
    DateTime? birthday,
    String? phoneNumber,
    String? role,
    String? gender,
    double? rates,
    int? votes,
  }) {
    return TeacherModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      birthday: birthday ?? this.birthday,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      gender: gender ?? this.gender,
      rates: rates ?? this.rates,
      votes: votes ?? this.votes,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'birthday': birthday.millisecondsSinceEpoch,
      'phoneNumber': phoneNumber,
      'role': role,
      'gender': gender,
      'rates': rates,
      'votes': votes,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      avatar: map['avatar'] != null
          ? ImageModel.fromMap(map['avatar'] as Map<String, dynamic>)
          : null,
      birthday:
          DateTime.fromMillisecondsSinceEpoch((map['birthday'] ?? 0) as int),
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      role: (map['role'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      rates: (map['rates'] ?? 0.0) as double,
      votes: (map['votes'] ?? 0) as int,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      avatar ??
          const ImageModel(
            url: "",
            blurHash: "",
          ),
      birthday,
      phoneNumber ?? "",
      role,
      gender,
      rates,
      votes,
    ];
  }
}
