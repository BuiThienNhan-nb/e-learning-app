import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../domain/entities/lesson_model.dart';
import '../../domain/repositories/lesson_repository.dart';
import '../datasources/lesson_data_source.dart';

class LessonRepositoryImp implements LessonRepository {
  final LessonDataSource dataSource;
  final NetworkStatus networkStatus;

  LessonRepositoryImp(this.dataSource, this.networkStatus);

  @override
  Future<Either<Failure, List<LessonModel>>> getRecommendedLessons() async {
    return dataSource.getRecommendedLessons();
  }
}
