import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/course_model.dart';

abstract class MyCourseDataSource {
  Future<Either<Failure, CourseModel>> createCourse(CourseModel course);
  Future<Either<Failure, CourseModel>> updateCourse(CourseModel course);
  Future<Either<Failure, bool>> deleteCourse(String courseId);
}

@LazySingleton(as: MyCourseDataSource)
class MyCourseDataSourceImp extends Api implements MyCourseDataSource {
  final String _createCourseEndpoint =
      "/courses/createCourseWithSectionAndLesson";

  @override
  Future<Either<Failure, CourseModel>> createCourse(CourseModel course) async {
    try {
      final Map<String, Object> requestData = course.toMap();
      log(Env.instance.baseUrl + _createCourseEndpoint);
      log(requestData.toString());

      final data = await post(
        Env.instance.baseUrl + _createCourseEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      // await Future.delayed(const Duration(seconds: 2));
      log(data["data"]["data"]["courseId"]);
      course.id = data["data"]["data"]["courseId"];

      return Right(course);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(String courseId) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CourseModel>> updateCourse(CourseModel course) {
    // TODO: implement updateCourse
    throw UnimplementedError();
  }
}
