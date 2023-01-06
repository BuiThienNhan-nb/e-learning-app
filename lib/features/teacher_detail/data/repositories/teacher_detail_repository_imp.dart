import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';
import '../../../home/domain/entities/course_model.dart';
import '../../domain/repositories/teacher_detail_repository.dart';
import '../datasources/teacher_detail_data_source.dart';

@LazySingleton(as: TeacherDetailRepository)
class TeacherDetailRepositoryImp implements TeacherDetailRepository {
  final NetworkStatus networkStatus;
  final TeacherDetailDataSource dataSource;

  TeacherDetailRepositoryImp(this.networkStatus, this.dataSource);

  @override
  Future<Either<Failure, TeacherModel>> getTeacherById(String teacherId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getTeacherById(teacherId);
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getTeacherCourse(
      String teacherId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getTeacherCourse(teacherId);
  }
}
