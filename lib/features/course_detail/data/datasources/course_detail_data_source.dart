import 'dart:developer' as logger;
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/bases/services/api_exception.dart';
import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/course_detail_model.dart';

abstract class CourseDetailDataSource {
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(String courseId);
}

@LazySingleton(as: CourseDetailDataSource)
class CourseDetailDataSourceImp extends Api implements CourseDetailDataSource {
  final String getCourseDetailEndpoint = "/courses/course";

  @override
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(
      String courseId) async {
    try {
      final Map<String, Object> requestData = {
        "courseId": "2cca189b-5ce6-4778-9a06-542272ef4be7",
      };

      final data = await post(
        Env.instance.baseUrl + getCourseDetailEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );

      final CourseModel course = CourseModel.fromMap(data["data"]["data"]);
      final CourseDetailModel courseDetail = CourseDetailModel(
        course: course,
        teacherId: "teacherId",
        isPaid: Random().nextBool(),
      );
      logger.log("Course detail: $courseDetail");
      return Right(courseDetail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
