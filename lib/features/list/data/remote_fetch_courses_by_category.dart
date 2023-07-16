import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/bases/services/api_exception.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:e_learning_app/features/auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import 'package:e_learning_app/features/list/domain/entities/fetch_courses_by_category_params.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/list/domain/repositories/fetch_courses_by_category.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RemoteFetchCoursesByCategory extends Api
    implements FetchCoursesByCategory {
  final String _fetchCourseByCategoryEndpoint = '/courses/searchCategories';

  @override
  Future<Either<Failure, List<CourseModel>>> call(
      FetchCoursesByCategoryParams params) async {
    try {
      final data = await post(
        Env.instance.baseUrl + _fetchCourseByCategoryEndpoint,
        data: {
          'content': params.category,
        },
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
          },
        ),
      );
      List<CourseModel> courses = (data["data"]["data"] as List)
          .map(
            (map) => CourseModel.fromMap(map),
          )
          .toList();
      debugPrint(courses.toString());
      return Right(courses);
    } catch (e) {
      return Left(ServerFailure("$e"));
    }
  }
}
