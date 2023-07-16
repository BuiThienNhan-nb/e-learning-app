import 'dart:developer' as logger;
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';
import '../../../auth/sign_in/domain/entities/user_model.dart';
import '../../../home/domain/entities/section_model.dart';
import '../../domain/entities/course_detail_model.dart';

abstract class CourseDetailDataSource {
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(String courseId);
  Future<Either<Failure, UserModel>> enrollCourse(
    String userId,
    String courseId,
  );
}

@LazySingleton(as: CourseDetailDataSource)
class CourseDetailDataSourceImp extends Api implements CourseDetailDataSource {
  final String _getCourseDetailEndpoint = "/courses/course";
  final String _getSectionsInCourse = "/sections/course";
  final String _getUserById = "/users/userById";
  final String _joinCourse = "/users/joinCourse";

  @override
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(
      String courseId) async {
    try {
      final Map<String, Object> requestData = {
        // "courseId": "5700874b-d2ca-47a8-ac38-4304ad9608b9",
        "courseId": courseId,
      };

      final data = await post(
        Env.instance.baseUrl + _getCourseDetailEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      final CourseModel course = CourseModel.fromMap(data["data"]["data"]);
      final sectionData = await post(
        Env.instance.baseUrl + _getSectionsInCourse,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
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
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      final CourseDetailModel courseDetail = CourseDetailModel(
        course: course,
        teacher: TeacherModel.fromMap(teacherData["data"]["data"]),
        isEnrolled:
            GetIt.I<AppProvider>().user.courseJoined.contains(course.id),
      );

      // sort course sections and lessons by order
      courseDetail.section.sort((a, b) => a.order - b.order);
      for (var element in courseDetail.section) {
        element.lessons.sort((a, b) => a.order - b.order);
      }

      // Fake lesson video length
      for (var section in courseDetail.section) {
        for (var lesson in section.lessons) {
          lesson.length = Random().nextInt(15);
        }
      }

      // logger.log("Course detail: $courseDetail");
      return Right(courseDetail);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> enrollCourse(
      String userId, String courseId) async {
    try {
      final requestData = {
        "userId": userId,
        "courseId": courseId,
      };
      final data = await post(
        Env.instance.baseUrl + _joinCourse,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );

      return Right(UserModel.fromMap(data["data"]["data"]));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
