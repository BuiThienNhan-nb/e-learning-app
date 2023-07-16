import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../configs/env.dart';
import '../../local/datasources/auth_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../bases/services/api_exception.dart';
import '../../../../../../core/app/values.dart';
import '../../../../../../core/error/failures.dart';
import '../../../../../../generated/translations/locale_keys.g.dart';
import '../../../domain/entities/user_model.dart';

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

  Future<Either<Failure, UserModel>> getUserById(String userId);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp extends Api implements AuthRemoteDataSource {
  final String loginEndpoint = "/auth/email/login";
  final String registerEndpoint = "/auth/email/register";
  final String getUserByIdEndPoint = "/users/userById";

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
        return Left(statusToFailure(401));
      }
      final user = UserModel.fromMap(data["data"]["user"]);

      final localDataSource = GetIt.I<AuthLocalDataSource>();

      localDataSource
          .setAccessToken(data["data"]["token"]["access_token"].toString());
      localDataSource.setUserId(user.id);

      return Right(user);
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
          courseJoined: const [],
        ),
      );
    } catch (e) {
      return Left(exceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserById(String userId) async {
    try {
      final requestData = {
        "userId": userId,
      };

      final data = await post(
        Env.instance.baseUrl + getUserByIdEndPoint,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      final UserModel user = UserModel.fromMap(data["data"]["data"]);

      return Right(user);
    } catch (e) {
      return left(UserFailure(e.toString()));
    }
  }
}
