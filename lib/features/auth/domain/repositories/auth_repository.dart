import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_info.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserInfo>> signIn(
    String email,
    String password,
  );

  Future<Either<Failure, UserInfo>> signUp({
    required String name,
    required String email,
    required String password,
    String? phoneNumber,
    String? avatar,
    required DateTime birthday,
  });

  Future<Either<Failure, void>> signOut();
}
