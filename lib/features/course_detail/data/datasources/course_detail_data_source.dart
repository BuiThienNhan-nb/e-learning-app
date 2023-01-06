import 'dart:developer' as logger;
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/course_model.dart';
import '../../../home/domain/entities/section_model.dart';
import '../../domain/entities/course_detail_model.dart';

abstract class CourseDetailDataSource {
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(String courseId);
}

@LazySingleton(as: CourseDetailDataSource)
class CourseDetailDataSourceImp extends Api implements CourseDetailDataSource {
  final String _getCourseDetailEndpoint = "/courses/course";
  final String _getSectionsInCourse = "/sections/course";
  final String _getUserById = "/users/userById";

  @override
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(
      String courseId) async {
    try {
      final Map<String, Object> requestData = {
        "courseId": "5700874b-d2ca-47a8-ac38-4304ad9608b9",
      };

      final data = await post(
        Env.instance.baseUrl + _getCourseDetailEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      final CourseModel course = CourseModel.fromMap(data["data"]["data"]);
      final sectionData = await post(
        Env.instance.baseUrl + _getSectionsInCourse,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      course.section = (sectionData["data"]["data"] as List)
          .map(
            (map) => SectionModel.fromMap(map),
          )
          .toList();
      final teacherData = await post(
        Env.instance.baseUrl + _getUserById,
        data: {
          "userId": data["data"]["data"]["authorId"],
        },
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      final CourseDetailModel courseDetail = CourseDetailModel(
        course: course,
        teacher: TeacherModel.fromMap(teacherData["data"]["data"]),
        isEnrolled: Random().nextBool(),
      );

      // sort course sections and lessons by order
      courseDetail.section.sort((a, b) => a.order - b.order);
      for (var element in courseDetail.section) {
        element.lessons.sort((a, b) => a.order - b.order);
      }

      logger.log("Course detail: $courseDetail");
      return Right(courseDetail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
