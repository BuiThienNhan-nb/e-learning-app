import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/entities/exam_model.dart';
import '../../domain/repositories/create_exam_repository.dart';
import '../datasources/create_exam_data_source.dart';

@LazySingleton(as: CreateExamRepository)
class CreateExamRepositoryImp implements CreateExamRepository {
  final NetworkStatus networkStatus;
  final CreateExamDataSource dataSource;

  CreateExamRepositoryImp(this.networkStatus, this.dataSource);

  @override
  Future<Either<Failure, ExamModel>> createLessonExam(ExamModel exam) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.createLessonExam(exam);
  }

  @override
  Future<Either<Failure, ExamModel?>> getLessonExam(String lessonId) async {
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
