import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../bases/services/base_api.dart';
import '../../../../core/app/values.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/translations/locale_keys.g.dart';
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
    String? phoneNumber,
    String? avatar,
    required DateTime birthday,
  });

  Future<Either<Failure, void>> signOut();
}

class AuthRemoteDataSourceImp extends BaseApi implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, UserInfo>> signIn(
      String email, String password) async {
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
          if (email.compareTo(AppValues.mockEmail) != 0) {
            failureMessage = LocaleKeys.wrongEmail.tr();
          }
          if (password.compareTo(AppValues.mockPassword) != 0) {
            failureMessage = LocaleKeys.wrongPassword.tr();
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
          id: "id",
          name: "Bùi Thiện Nhân",
          email: AppValues.mockEmail,
          birthday: DateTime(2001, 9, 25),
          role: AppValues.roles.last,
        ),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          e is ServerException ? e.message : e.toString(),
        ),
      );
      // throw ServerException(
      //   e is ServerException ? e.message : e.toString(),
      // );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserInfo>> signUp(
      {required String name,
      required String email,
      required String password,
      String? phoneNumber,
      String? avatar,
      required DateTime birthday}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
