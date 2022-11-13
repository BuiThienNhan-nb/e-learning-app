import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/entities/course_model.dart';
import '../../domain/repositories/get_rcm_lessons_repository.dart';
import '../datasources/get_rcm_lesson_data_source.dart';

@LazySingleton(as: GetRecommendedLessonsRepository)
class GetRecommendedLessonsRepositoryImp
    implements GetRecommendedLessonsRepository {
  final GetRecommendedLessonsDataSource dataSource;
  final NetworkStatus networkStatus;

  GetRecommendedLessonsRepositoryImp(this.dataSource, this.networkStatus);

  @override
  Future<Either<Failure, List<CourseModel>>> getRecommendedLessons() async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getRecommendedLessons();
  }
}
