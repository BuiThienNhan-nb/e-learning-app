import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';
import '../../../home/domain/entities/course_model.dart';

abstract class TeacherDetailDataSource {
  Future<Either<Failure, TeacherModel>> getTeacherById(String teacherId);
  Future<Either<Failure, List<CourseModel>>> getTeacherCourse(String teacherId);
}

@LazySingleton(as: TeacherDetailDataSource)
class TeacherDetailDataSourceImp extends Api
    implements TeacherDetailDataSource {
  final String _getTeacherById = "/users/userById";
  final String _getCourseByTeacher = "/courses/getCourseByTeacher";

  @override
  Future<Either<Failure, TeacherModel>> getTeacherById(String teacherId) async {
    try {
      final requestData = {
        // "userId": teacherId,
        "userId": teacherId,
      };

      final data = await post(
        Env.instance.baseUrl + _getTeacherById,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      final TeacherModel teacher = TeacherModel.fromMap(data["data"]["data"]);
      final random = Random();
      teacher.rates = (random.nextInt(5) + random.nextDouble());
      teacher.votes = random.nextInt(40000);
      return Right(teacher);
    } catch (e) {
      return left(UserFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getTeacherCourse(
      String teacherId) async {
    try {
      final requestData = {
        // "userId": teacherId,
        "authorId": teacherId,
      };

      final data = await post(
        Env.instance.baseUrl + _getCourseByTeacher,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      List<CourseModel> courses = (data["data"]["data"] as List)
          .map(
            (map) => CourseModel.fromMap(map),
          )
          .toList();

      return Right(courses);
    } catch (e) {
      return left(UserFailure(e.toString()));
    }
  }
}
