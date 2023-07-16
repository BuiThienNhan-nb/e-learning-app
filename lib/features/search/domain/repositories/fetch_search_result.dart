import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/search/domain/entities/search_result_query_params.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

abstract class FetchSearchResult {
  Future<Either<Failure, List<CourseModel>>> call(
      SearchResultQueryParams keyword);
}
