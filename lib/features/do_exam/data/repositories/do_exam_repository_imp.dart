import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../create_exam/domain/entities/exam_model.dart';
import '../../domain/repositories/do_exam_repository.dart';
import '../datasources/do_exam_data_source.dart';

@LazySingleton(as: DoExamRepository)
class DoExamRepositoryImp implements DoExamRepository {
  final NetworkStatus networkStatus;
  final DoExamDataSource dataSource;

  DoExamRepositoryImp(this.networkStatus, this.dataSource);

  @override
  Future<Either<Failure, ExamModel>> getLessonExam(String lessonId) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getLessonExam(lessonId);
  }
}
