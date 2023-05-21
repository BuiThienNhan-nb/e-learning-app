import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import '../../domain/entities/exam_model.dart';

abstract class CreateExamDataSource {
  Future<Either<Failure, ExamModel?>> getLessonExam(
    String lessonId,
  );
  Future<Either<Failure, ExamModel>> createLessonExam(ExamModel exam);
}

@LazySingleton(as: CreateExamDataSource)
class CreateExamDataSourceImp extends Api implements CreateExamDataSource {
  final String _getExam = "/exams/exam";
  final String _createExam = "/exams/create";

  @override
  Future<Either<Failure, ExamModel>> createLessonExam(ExamModel exam) async {
    try {
      final requestData = exam.toMap();

      final data = await post(
        Env.instance.baseUrl + _createExam,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );

      return Right(ExamModel.fromMap(data["data"]));
    } catch (e) {
      return Left(UserFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ExamModel?>> getLessonExam(String lessonId) async {
    // try {
    final requestData = {
      "lessonId": lessonId,
    };

    final data = await post(
      Env.instance.baseUrl + _getExam,
      data: requestData,
      options: Options(headers: {
        "Authorization":
            "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
      }),
    );
    if (data["success"] == false &&
        data["data"]["response"] == "Exam not found") {
      return const Right(null);
    }

    return Right(ExamModel.fromMap(data["data"]));
    // } catch (e) {
    //   return Left(UserFailure(e.toString()));
    // }
  }
}
