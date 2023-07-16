import 'dart:developer';

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

abstract class GetRecommendedCoursesDataSource {
  Future<Either<Failure, List<CourseModel>>> getRecommendedLessons();
}

@LazySingleton(as: GetRecommendedCoursesDataSource)
class GetRecommendedCoursesDataSourceImp extends Api
    implements GetRecommendedCoursesDataSource {
  // final String _getAllCoursesEndPoint = "/courses/courses";
  final String _getRecommendedCourses = "/courses/recommend";

  @override
  Future<Either<Failure, List<CourseModel>>> getRecommendedLessons() async {
    try {
      final data = await post(
        Env.instance.recommendUrl + _getRecommendedCourses,
        data: {
          "userId": GetIt.I<AppProvider>().user.id,
        },
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      List<CourseModel> courses = (data["data"]["data"] as List)
          .map(
            (map) => CourseModel.fromMap(map),
          )
          .toList();
      print(courses.toString());
      return Right(courses);
    } catch (e) {
      return Left(ServerFailure("$e"));
    }
  }
}
