import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/course_review_model.dart';

abstract class CourseRateDataSource {
  Future<Either<Failure, int?>> getCourseRate(
    String courseId,
    String userId,
  );

  Future<Either<Failure, List<CourseReviewModel>>> getListReviewOfCourse(
    String courseId,
  );

  Future<Either<Failure, int>> rateCourse(
    CourseReviewModel courseReviewModel,
  );
}

@LazySingleton(as: CourseRateDataSource)
class CourseRateDataSourceImp extends Api implements CourseRateDataSource {
  final String _getCourseRateEndpoint = "/rates/rate";
  final String _rateCourseEndpoint = "/rates/create";
  final String _getCourseReviews = "/rates/rateByCourse";

  @override
  Future<Either<Failure, int?>> getCourseRate(
      String courseId, String userId) async {
    try {
      final Map<String, Object> requestData = {
        "courseId": courseId,
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
    CourseReviewModel courseReviewModel,
  ) async {
    try {
      final Map<String, Object> requestData = {
        "userId": courseReviewModel.userId,
        "courseId": courseReviewModel.courseId,
        "score": courseReviewModel.score,
        "comment": courseReviewModel.comment,
      };

      final data = await post(
        Env.instance.baseUrl + _rateCourseEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      final review = CourseReviewModel.fromMap(data["data"]["data"]);
      return Right(review.score);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CourseReviewModel>>> getListReviewOfCourse(
      String courseId) async {
    try {
      final requestData = {
        "courseId": courseId,
      };

      final data = await post(
        Env.instance.baseUrl + _getCourseReviews,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );

      if (data["data"]["success"] == false) {
        return const Right([]);
      }
      final List<CourseReviewModel> reviews = (data["data"]["data"] as List)
          .map((e) => CourseReviewModel.fromMap(e))
          .toList();
      return Right(reviews);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
