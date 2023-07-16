import 'package:dio/dio.dart';
import 'package:e_learning_app/bases/services/api_exception.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:e_learning_app/features/auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import 'package:e_learning_app/features/search/domain/entities/search_result_query_params.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/search/domain/repositories/fetch_search_result.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FetchSearchResult)
class RemoteFetchSearchResult extends Api implements FetchSearchResult {
  final String _fetchSearchResultEndPoint = '/courses/search';

  @override
  Future<Either<Failure, List<CourseModel>>> call(
      SearchResultQueryParams keyword) async {
    try {
      final data = await post(
        Env.instance.baseUrl + _fetchSearchResultEndPoint,
        data: {
          'content': keyword.keyword,
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
