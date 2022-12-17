import 'package:e_learning_app/features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart';
import 'package:e_learning_app/features/lesson_detail/domain/entities/lesson_comment_model.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/lesson_detail/domain/repositories/get_lesson_comments.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';

@LazySingleton(as: GetLessonCommentsRepository)
class GetLessonCommentsRepositoryImp implements GetLessonCommentsRepository {
  final NetworkStatus networkStatus;
  final GetLessonCommentsDataSource dataSource;

  GetLessonCommentsRepositoryImp({
    required this.dataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, List<LessonCommentModel>>> getLessonComments(
      String lessonId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getLessonComments(lessonId);
  }
}
