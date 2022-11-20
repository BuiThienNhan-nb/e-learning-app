// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final String userId;
  final String courseId;
  String status;
  String paymentMethod;
  final double price;
  final DateTime paymentDate;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.status,
    required this.paymentMethod,
    required this.price,
    required this.paymentDate,
  });

  TransactionModel copyWith({
    String? id,
    String? userId,
    String? courseId,
    String? status,
    String? paymentMethod,
    double? price,
    DateTime? paymentDate,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      courseId: courseId ?? this.courseId,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      price: price ?? this.price,
      paymentDate: paymentDate ?? this.paymentDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'courseId': courseId,
      'status': status,
      'paymentMethod': paymentMethod,
      'price': price,
      'paymentDate': paymentDate.millisecondsSinceEpoch,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: (map['id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      courseId: (map['courseId'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      paymentMethod: (map['paymentMethod'] ?? '') as String,
      price: (map['price'] ?? 0.0) as double,
      paymentDate:
          DateTime.fromMillisecondsSinceEpoch((map['paymentDate'] ?? 0) as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      userId,
      courseId,
      status,
      paymentMethod,
      price,
      paymentDate,
    ];
  }
}
