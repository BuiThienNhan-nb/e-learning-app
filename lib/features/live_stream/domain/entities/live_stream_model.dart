// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LiveStreamModel extends Equatable {
  final String id;
  final String userId;
  final String userName;

  const LiveStreamModel({
    required this.id,
    required this.userId,
    required this.userName,
  });

  LiveStreamModel copyWith({
    String? id,
    String? userId,
    String? userName,
  }) {
    return LiveStreamModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }

  Map<String, Object?> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'userId': userId,
      'userName': userName,
    };
  }

  factory LiveStreamModel.fromMap(Map<String, dynamic> map) {
    return LiveStreamModel(
      id: (map['_id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      userName: (map['userName'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LiveStreamModel.fromJson(String source) =>
      LiveStreamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, userId, userName];
}
