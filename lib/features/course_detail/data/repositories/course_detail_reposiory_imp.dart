import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/app/provider.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/user_model.dart';
import 'package:e_learning_app/features/course_detail/data/datasources/course_detail_data_source.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/entities/course_detail_model.dart';
import '../../domain/repositories/course_detail_repository.dart';

@LazySingleton(as: CourseDetailRepository)
class CourseDetailRepositoryImp implements CourseDetailRepository {
  final CourseDetailDataSource dataSource;
  final NetworkStatus networkStatus;

  CourseDetailRepositoryImp({
    required this.dataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(
      String courseId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getCourseDetail(courseId);
  }

  @override
  Future<Either<Failure, UserModel>> enrollCourse(
      String userId, String courseId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    if (!GetIt.I<AppProvider>().user.isPremium) {
      return const Left(
        UserFailure(
          "Required Premium Account before join course!",
        ),
      );
    }

    return dataSource.enrollCourse(userId, courseId);
  }
}
