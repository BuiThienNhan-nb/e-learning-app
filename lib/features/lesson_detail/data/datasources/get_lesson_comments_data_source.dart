import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import '../../domain/entities/lesson_comment_model.dart';

abstract class GetLessonCommentsDataSource {
  Future<Either<Failure, List<LessonCommentModel>>> getLessonComments(
      String lessonId);
}

@LazySingleton(as: GetLessonCommentsDataSource)
class GetLessonCommentsDataSourceImp extends Api
    implements GetLessonCommentsDataSource {
  final String getLessonCommentsEndpoint = "/comments/comments";

  @override
  Future<Either<Failure, List<LessonCommentModel>>> getLessonComments(
      String lessonId) async {
    try {
      final Map<String, String> requestData = {
        // "lessonId": lessonId,
        "lessonId": lessonId,
      };

      final data = await post(
        Env.instance.baseUrl + getLessonCommentsEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      if (data["data"]["data"] == null) {
        return const Right([]);
      }
      final List<LessonCommentModel> comments = (data["data"]["data"] as List)
          .map(
            (e) => LessonCommentModel.fromMap(e),
          )
          .toList();
      comments.sort((a, b) => b.commentAt.compareTo(a.commentAt));

      return Right(comments);
    } catch (e) {
      return Left(ServerFailure("$e"));
    }
  }
}
