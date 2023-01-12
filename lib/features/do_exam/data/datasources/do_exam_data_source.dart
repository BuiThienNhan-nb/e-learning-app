import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/bases/services/api_exception.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../create_exam/domain/entities/exam_model.dart';

abstract class DoExamDataSource {
  Future<Either<Failure, ExamModel>> getLessonExam(
    String lessonId,
  );
}

@LazySingleton(as: DoExamDataSource)
class DoExamDataSourceImp extends Api implements DoExamDataSource {
  final String _getExam = "/exams/exam";

  @override
  Future<Either<Failure, ExamModel>> getLessonExam(String lessonId) async {
    try {
      final requestData = {
        "lessonId": lessonId,
      };

      final data = await post(
        Env.instance.baseUrl + _getExam,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      if (data["success"] == false &&
          data["data"]["response"] == "Exam not found") {
        return const Left(
          UserFailure(
              "This lesson does not contain any exam yet! Please comeback later!"),
        );
      }

      return Right(ExamModel.fromMap(data["data"]));
    } catch (e) {
      return Left(UserFailure(e.toString()));
    }
  }
}
