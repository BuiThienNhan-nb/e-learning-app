import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/course_model.dart';

abstract class GetAllCoursesDataSource {
  Future<Either<Failure, List<CourseModel>>> getAllCourses();
}

@LazySingleton(as: GetAllCoursesDataSource)
class GetAllCoursesDataSourceImp extends Api
    implements GetAllCoursesDataSource {
  final String _getAllCoursesEndPoint = "/courses/courses";

  @override
  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    try {
      final data = await get(
        Env.instance.baseUrl + _getAllCoursesEndPoint,
        options: Options(headers: {
          "Authorization": "Bearer  ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      List<CourseModel> courses = (data["data"]["data"] as List)
          .map(
            (map) => CourseModel.fromMap(map),
          )
          .toList();
      return Right(courses);
    } catch (e) {
      return Left(UserFailure(e.toString()));
    }
  }
}
