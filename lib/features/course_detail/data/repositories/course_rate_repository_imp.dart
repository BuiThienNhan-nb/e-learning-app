import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/course_detail/data/datasources/course_rate_data_source.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/repositories/course_rate_repository.dart';

@LazySingleton(as: CourseRateRepository)
class CourseRateRepositoryImp implements CourseRateRepository {
  final CourseRateDataSource dataSource;
  final NetworkStatus networkStatus;

  CourseRateRepositoryImp({
    required this.dataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, int?>> getCourseRate(
      String courseId, String userId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getCourseRate(courseId, userId);
  }

  @override
  Future<Either<Failure, int>> rateCourse(
      String courseId, String userId, int score) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.rateCourse(courseId, userId, score);
  }
}
