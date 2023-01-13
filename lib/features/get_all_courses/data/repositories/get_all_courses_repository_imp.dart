import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../home/domain/entities/course_model.dart';
import '../../domain/repositories/get_all_courses_repository.dart';
import '../datasources/get_all_courses_data_source.dart';

@LazySingleton(as: GetAllCoursesRepository)
class GetAllCoursesRepositoryImp implements GetAllCoursesRepository {
  final NetworkStatus networkStatus;
  final GetAllCoursesDataSource dataSource;

  GetAllCoursesRepositoryImp(this.networkStatus, this.dataSource);

  @override
  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(LocaleKeys.connectivityException.tr()),
      );
    }

    return dataSource.getAllCourses();
  }
}
