import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/top/domain/entities/google_search_modal.dart';

abstract class SearchByGoogleApi {
  Future<Either<Failure, List<GoogleSearchModel>>> call();
}
