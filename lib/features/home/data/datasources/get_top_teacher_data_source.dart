import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../utils/mock/mock_teachers.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';

abstract class GetTopTeachersDataSource {
  Future<Either<Failure, List<TeacherModel>>> getTopTeachers();
}

@LazySingleton(as: GetTopTeachersDataSource)
class GetTopTeachersDataSourceImp extends Api
    implements GetTopTeachersDataSource {
  @override
  Future<Either<Failure, List<TeacherModel>>> getTopTeachers() async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(GetIt.I<MockTeachers>().topTeachers);
  }
}
