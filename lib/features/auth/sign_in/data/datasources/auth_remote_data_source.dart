import 'dart:developer' as logger;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:injectable/injectable.dart';

import '../../../../../bases/services/api_exception.dart';
import '../../../../../core/app/values.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../domain/entities/user_info.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserInfo>> signIn(
    String email,
    String password,
  );

  Future<Either<Failure, UserInfo>> signUp({
    required String name,
    required String email,
    required String password,
    required String? phoneNumber,
    String? avatar,
    required String birthday,
    required String gender,
    required String role,
  });

  Future<Either<Failure, void>> signOut();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp extends Api implements AuthRemoteDataSource {
  final String loginEndpoint = "/auth/email/login";
  final String registerEndpoint = "/auth/email/register";
  final Dio dio1 = Dio();

  @override
  Future<Either<Failure, UserInfo>> signIn(
      String email, String password) async {
    final Map<String, String> requestData = {
      "email": email,
      "password": password,
    };

    try {
      final data = await post(
        Env.instance.baseUrl + loginEndpoint,
        data: requestData,
      );

      logger.log(data["data"]["user"]["name"]);

      return Right(
        UserInfo(
          id: data["data"]["token"]["access_token"],
          name: data["data"]["user"]["name"],
          email: data["data"]["user"]["email"],
          birthday: DateTime(2001, 9, 25),
          role: AppValues.instance.title.last,
          gender: LocaleKeys.ma,
        ),
      );
    } catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserInfo>> signUp({
    required String name,
    required String email,
    required String password,
    required String? phoneNumber,
    String? avatar,
    required String birthday,
    required String gender,
    required String role,
  }) async {
    final Map<String, String> requestData = {
      "email": email,
      "password": password,
      "name": name,
      "gender": gender,
      "birthdayDate": birthday,
      "role": role,
    };

    try {
      final data = await post(
        Env.instance.baseUrl + registerEndpoint,
        data: requestData,
      );

      return Right(
        UserInfo(
          id: "id_register",
          name: "Bùi Thiện Nhân",
          email: AppValues.instance.mockEmail,
          birthday: DateTime(2001, 9, 25),
          role: AppValues.instance.title.last,
          gender: LocaleKeys.ma,
        ),
      );
    } catch (e) {
      return Left(exceptionToFailure(e));
    }
  }
}
