import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import '../../../home/domain/entities/course_model.dart';

abstract class EnrolledCourseDataSource {
  Future<Either<Failure, List<CourseModel>>> getCourseByListId(
      List<String> listId);
}

@LazySingleton(as: EnrolledCourseDataSource)
class EnrolledCourseDataSourceImp extends Api
    implements EnrolledCourseDataSource {
  final String _getCourseByListId = "/courses/getCourseByList";

  @override
  Future<Either<Failure, List<CourseModel>>> getCourseByListId(
      List<String> listId) async {
    try {
      final requestData = {
        "listCourseId": listId,
      };

      final data = await post(
        Env.instance.baseUrl + _getCourseByListId,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      final List<CourseModel> courses = (data["data"]["data"] as List)
          .map(
            (map) => CourseModel.fromMap(map),
          )
          .toList();

      return Right(courses);
    } catch (e) {
      return Left(UserFailure(e.toString()));
    }
  }
}
