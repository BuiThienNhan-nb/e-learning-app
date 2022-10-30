import 'package:e_learning_app/core/platform/network_status.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/home/data/datasources/get_top_teacher_data_source.dart';
import 'package:e_learning_app/features/home/domain/repositories/get_top_teacher_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../generated/translations/locale_keys.g.dart';

@LazySingleton(as: GetTopTeachersRepository)
class GetTopTeachersRepositoryImp implements GetTopTeachersRepository {
  final GetTopTeachersDataSource dataSource;
  final NetworkStatus networkStatus;

  GetTopTeachersRepositoryImp(this.dataSource, this.networkStatus);

  @override
  Future<Either<Failure, List<TeacherModel>>> getTopTeachers() async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getTopTeachers();
  }
}
