import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';

abstract class GetTopTeachersDataSource {
  Future<Either<Failure, List<TeacherModel>>> getTopTeachers();
}

@LazySingleton(as: GetTopTeachersDataSource)
class GetTopTeachersDataSourceImp extends Api
    implements GetTopTeachersDataSource {
  final String _getTeacherEndpoint = "/users/teacher";

  @override
  Future<Either<Failure, List<TeacherModel>>> getTopTeachers() async {
    try {
      final data = await get(
        Env.instance.baseUrl + _getTeacherEndpoint,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      List<TeacherModel> teachers = (data["data"]["data"] as List)
          .map(
            (map) => TeacherModel.fromMap(map),
          )
          .toList();
      return Right(teachers);
    } catch (e) {
      return Left(ServerFailure("$e"));
    }
  }
}
