import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/domain/entities/user_model.dart';

abstract class UpdateProfileDataSource {
  Future<Either<Failure, UserModel>> updateProfile(UserModel user);
}

@LazySingleton(as: UpdateProfileDataSource)
class UpdateProfileDataSourceImp extends Api
    implements UpdateProfileDataSource {
  final String _updateProfileEndPoint = "/users/profile/update";

  @override
  Future<Either<Failure, UserModel>> updateProfile(UserModel user) async {
    try {
      final Map<String, Object?> requestData = user.toMap();

      final data = await post(
        Env.instance.baseUrl + _updateProfileEndPoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      return Right(
        UserModel.fromMap(data["data"]["data"]),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
