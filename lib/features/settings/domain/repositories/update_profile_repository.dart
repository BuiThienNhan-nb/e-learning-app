import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/domain/entities/user_model.dart';

abstract class UpdateProfileRepository {
  Future<Either<Failure, UserModel>> updateProfile(UserModel user);
}
