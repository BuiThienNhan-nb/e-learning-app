// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_learning_app/configs/formats.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  String name;
  final String email;
  String? avatar;
  DateTime birthday;
  String? phoneNumber;
  final String role;
  String gender;
  bool isPremium;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.birthday,
    this.phoneNumber,
    required this.role,
    required this.gender,
    required this.isPremium,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
    DateTime? birthday,
    String? phoneNumber,
    String? role,
    String? gender,
    bool? isPremium,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      birthday: birthday ?? this.birthday,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      gender: gender ?? this.gender,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'userId': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'birthday': AppFormats.instance.formatDay.format(birthday),
      'phoneNumber': phoneNumber,
      'role': role,
      'gender': gender,
      'isPremium': isPremium,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['userId'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      avatar: (map['avatar']) as String?,
      birthday: map['birthday'] == null
          ? DateTime(2001, 09, 25)
          : AppFormats.instance.formatDay.parse(map['birthday']),
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      role: (map['role'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      isPremium: (map['isPremium'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      avatar ?? "",
      birthday,
      phoneNumber ?? "",
      role,
      gender,
      isPremium,
    ];
  }
}
