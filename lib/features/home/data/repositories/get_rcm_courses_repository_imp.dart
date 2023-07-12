import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/repositories/get_rcm_courses_repository.dart';
import '../datasources/get_rcm_courses_data_source.dart';

@LazySingleton(as: GetRecommendedCoursesRepository)
class GetRecommendedCoursesRepositoryImp
    implements GetRecommendedCoursesRepository {
  final GetRecommendedCoursesDataSource dataSource;
  final NetworkStatus networkStatus;

  GetRecommendedCoursesRepositoryImp(this.dataSource, this.networkStatus);

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
