import 'dart:developer' as logger;
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../../bases/services/api_exception.dart';
import '../../../../../core/app/values.dart';
import '../../../../../core/error/exceptions.dart';
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
    required DateTime birthday,
    required String gender,
    required String role,
  });

  Future<Either<Failure, void>> signOut();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp extends Api implements AuthRemoteDataSource {
  final String loginEndpoint = "/auth/login";
  final Dio dio1 = Dio();

  @override
  Future<Either<Failure, UserInfo>> signIn(
      String email, String password) async {
    final Map<String, String> requestData = {
      "username": email,
      "password": password,
    };

    try {
      final data = await post(
        Env.instance.baseUrl + loginEndpoint,
        data: requestData,
      );

      logger.log(data);

      return Right(
        UserInfo(
          id: "id_login",
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
    required DateTime birthday,
    required String gender,
    required String role,
  }) async {
    // Building example of implements of DataSource

    // Pretending exceptions
    final bool isException = Random().nextBool();
    final String exceptionMessage = LocaleKeys.serverNotRespond.tr();

    // Pretending error from request
    String failureMessage = "";

    try {
      // Fake api calling
      await Future.delayed(
        const Duration(milliseconds: 1500),
      ).then(
        (_) {
          if (email.compareTo(AppValues.instance.mockEmail) == 0) {
            failureMessage = LocaleKeys.emailExist.tr();
          }
        },
      );
      if (isException) {
        throw ServerException(exceptionMessage);
      }

      if (failureMessage.isNotEmpty) {
        // Return not success
        return Left(
          UserFailure(failureMessage),
        );
      }
      // Return success data
      return Right(
        UserInfo(
          id: "id_register",
          name: name,
          email: email,
          birthday: birthday,
          role: role,
          gender: gender,
          phoneNumber: phoneNumber,
        ),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          e is ServerException ? e.message : e.toString(),
        ),
      );
    }
  }
}
