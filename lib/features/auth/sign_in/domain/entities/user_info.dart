// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:e_learning_app/features/auth/sign_in/domain/entities/image_model.dart';

class UserInfo extends Equatable {
  final String id;
  String name;
  final String email;
  ImageModel? avatar;
  DateTime birthday;
  String? phoneNumber;
  final String role;
  String gender;

  UserInfo({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.birthday,
    this.phoneNumber,
    required this.role,
    required this.gender,
  });

  UserInfo copyWith({
    String? id,
    String? name,
    String? email,
    ImageModel? avatar,
    DateTime? birthday,
    String? phoneNumber,
    String? role,
    String? gender,
  }) {
    return UserInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      birthday: birthday ?? this.birthday,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar?.toMap(),
      'birthday': birthday.millisecondsSinceEpoch,
      'phoneNumber': phoneNumber,
      'role': role,
      'gender': gender,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
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
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

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
    ];
  }
}
