import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/home/domain/entities/section_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../home/domain/entities/course_model.dart';
import '../../domain/repositories/my_course_repository.dart';
import '../datasources/my_course_data_source.dart';

@LazySingleton(as: MyCourseRepository)
class MyCourseRepositoryImp implements MyCourseRepository {
  final MyCourseDataSource dataSource;
  final NetworkStatus networkStatus;

  MyCourseRepositoryImp(this.dataSource, this.networkStatus);

  @override
  Future<Either<Failure, CourseModel>> createCourse(CourseModel course) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.createCourse(course);
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(String courseId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.deleteCourse(courseId);
  }

  @override
  Future<Either<Failure, CourseModel>> updateCourseInformation(
    CourseModel course,
    bool isUpdateImage,
  ) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.updateCourseInformation(course, isUpdateImage);
  }

  @override
  Future<Either<Failure, SectionModel>> updateCourseSection(
    SectionModel section,
    String courseId,
  ) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.updateCourseSection(
      section,
      courseId,
    );
  }
}
