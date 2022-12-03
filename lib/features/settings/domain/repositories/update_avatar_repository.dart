import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';

abstract class UpdateAvatarRepository {
  Future<Either<Failure, bool>> updateAvatar(String path);
}
