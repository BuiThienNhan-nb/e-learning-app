// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:e_learning_app/features/auth/sign_in/domain/entities/user_model.dart';

class TeacherModel extends UserModel {
  double rates;
  int votes;

  TeacherModel({
    // required super.id,
    // required super.name,
    // required super.email,
    // required super.birthday,
    // required super.role,
    // required super.gender,
    // required super.avatar,
    // required super.phoneNumber,
    // required super.isPremium,
    required UserModel user,
    required this.rates,
    required this.votes,
  }) : super(
          id: user.id,
          name: user.name,
          email: user.email,
          birthday: user.birthday,
          role: user.role,
          gender: user.gender,
          avatar: user.avatar,
          phoneNumber: user.phoneNumber,
          isPremium: user.isPremium,
          courseJoined: user.courseJoined,
        );

  @override
  TeacherModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
    DateTime? birthday,
    String? phoneNumber,
    String? role,
    String? gender,
    double? rates,
    int? votes,
    bool? isPremium,
    List<String>? courseJoined,
  }) {
    return TeacherModel(
      user: UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        avatar: avatar ?? this.avatar,
        birthday: birthday ?? this.birthday,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        role: role ?? this.role,
        gender: gender ?? this.gender,
        isPremium: isPremium ?? this.isPremium,
        courseJoined: courseJoined ?? this.courseJoined,
      ),
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
      'isPremium': isPremium,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      user: UserModel.fromMap(map),
      // id: (map['userId'] ?? '') as String,
      // name: (map['name'] ?? '') as String,
      // email: (map['email'] ?? '') as String,
      // avatar: (map['avatar'] ?? '') as String,
      // birthday: AppFormats.instance.formatDay
      //     .parse((map['birthday'] ?? "25/09/2001") as String),
      // phoneNumber:
      //     map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      // role: (map['role'] ?? '') as String,
      // gender: (map['gender'] ?? '') as String,
      rates: (map['rates'] ?? 0.0) as double,
      votes: (map['votes'] ?? 0) as int,
      // isPremium: (map['isPremium'] ?? false) as bool,
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
      avatar ?? "",
      birthday,
      phoneNumber ?? "",
      role,
      gender,
      rates,
      votes,
      isPremium,
    ];
  }
}
