import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';

abstract class CourseRateDataSource {
  Future<Either<Failure, int?>> getCourseRate(
    String courseId,
    String userId,
  );

  Future<Either<Failure, int>> rateCourse(
    String courseId,
    String userId,
    int score,
  );
}

@LazySingleton(as: CourseRateDataSource)
class CourseRateDataSourceImp extends Api implements CourseRateDataSource {
  final String _getCourseRateEndpoint = "/rates/rate";
  final String _rateCourseEndpoint = "/rates/create";

  final String _testCourseId = "2cca189b-5ce6-4778-9a06-542272ef4be7";

  @override
  Future<Either<Failure, int?>> getCourseRate(
      String courseId, String userId) async {
    try {
      final Map<String, Object> requestData = {
        "courseId": _testCourseId,
        "userId": userId,
      };

      final data = await post(
        Env.instance.baseUrl + _getCourseRateEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );

      int? score;
      if (data["data"]["success"] == true) {
        score = data["data"]["data"]["score"];
      }
      log(score.toString());
      return Right(score);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> rateCourse(
      String courseId, String userId, int score) async {
    try {
      final Map<String, Object> requestData = {
        "userId": userId,
        "courseId": _testCourseId,
        "score": score,
      };

      final data = await post(
        Env.instance.baseUrl + _rateCourseEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );

      // log(data["data"]);
      return Right(score);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
