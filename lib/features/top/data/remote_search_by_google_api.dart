import 'package:e_learning_app/bases/services/api_exception.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:e_learning_app/features/top/domain/entities/google_search_modal.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/top/domain/repositories/search_by_google_api.dart';
import 'package:e_learning_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchByGoogleApi)
class RemoteSearchByGoogleApi extends Api implements SearchByGoogleApi {
  @override
  Future<Either<Failure, List<GoogleSearchModel>>> call() async {
    try {
      final data = await get(
        "${Env.instance.googleCustomSearchUrl}key=${Env.instance.googleApiKey}&cx=${Env.instance.googleSearchEngineId}&q=${AppConstants.searchQuery}",
      );
      if (data["error"] != null) {
        throw Exception(data["error"]["message"]);
      }
      final List<GoogleSearchModel> googleSearchResponse =
          (data["items"] as List)
              .map(
                (e) => GoogleSearchModel.fromMap(e),
              )
              .toList();
      debugPrint(googleSearchResponse.toString());
      return Right(googleSearchResponse);
    } catch (e) {
      debugPrint('Search by google api failed with error: $e');
      return const Left(
        ServerFailure('Unable to query search key! Please try again later!'),
      );
    }
  }
}
