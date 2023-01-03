import 'dart:developer' as logger;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:e_learning_app/core/app/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../../bases/services/api_exception.dart';
import '../../../../../core/app/values.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../domain/entities/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserModel>> signIn(
    String email,
    String password,
  );

  Future<Either<Failure, UserModel>> signUp({
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
  Future<Either<Failure, UserModel>> signIn(
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

      if (data["success"] == false) {
        return Left(statusToFailure(data["data"]["status"] as int));
      }
      logger.log(data["data"]["token"]["access_token"]);

      GetIt.I<AppProvider>().accessToken =
          data["data"]["token"]["access_token"].toString();

      return Right(
        UserModel.fromMap(data["data"]["user"]),
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
  Future<Either<Failure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String? phoneNumber,
    String? avatar,
    required String birthday,
    required String gender,
    required String role,
  }) async {
    final Map<String?, Object?> requestData = {
      "email": email,
      "password": password,
      "name": name,
      "gender": gender,
      "birthdayDate": birthday,
      "role": role.toLowerCase(),
      "phoneNumber": phoneNumber,
      "isPremium": false,
    };

    try {
      final data = await post(
        Env.instance.baseUrl + registerEndpoint,
        data: requestData,
      );

      return Right(
        UserModel(
          id: "id_register",
          name: "Bùi Thiện Nhân",
          email: AppValues.instance.mockEmail,
          birthday: DateTime(2001, 9, 25),
          role: AppValues.instance.title.last,
          gender: LocaleKeys.ma,
          isPremium: false,
        ),
      );
    } catch (e) {
      return Left(exceptionToFailure(e));
    }
  }
}
