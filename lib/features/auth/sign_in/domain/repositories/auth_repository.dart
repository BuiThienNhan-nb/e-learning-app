import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signIn(
    String email,
    String password,
  );

  Future<Either<Failure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String? phoneNumber,
    String? avatar,
    required String birthday,
    required String gender,
    required String role,
  });

  Future<Either<Failure, void>> signOut();
}
