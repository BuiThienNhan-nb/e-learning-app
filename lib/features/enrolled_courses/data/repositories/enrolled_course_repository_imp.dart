import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/platform/network_status.dart';
import 'package:e_learning_app/features/enrolled_courses/data/datasources/enrolled_course_data_source.dart';
import 'package:e_learning_app/features/enrolled_courses/domain/repositories/enrolled_course_repository.dart';
import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../generated/translations/locale_keys.g.dart';

@LazySingleton(as: EnrolledCourseRepository)
class EnrolledCourseRepositoryImp implements EnrolledCourseRepository {
  final NetworkStatus networkStatus;
  final EnrolledCourseDataSource dataSource;

  EnrolledCourseRepositoryImp(this.networkStatus, this.dataSource);

  @override
  Future<Either<Failure, List<CourseModel>>> getCourseByListId(
      List<String> listId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getCourseByListId(listId);
  }
}
