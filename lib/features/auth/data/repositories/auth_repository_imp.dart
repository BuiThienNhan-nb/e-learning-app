// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_learning_app/features/auth/domain/entities/user_info.dart';
import 'package:e_learning_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/platform/network_status.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource dataSource;
  final NetworkStatus networkStatus;

  AuthRepositoryImp({
    required this.dataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, UserInfo>> signIn(
      String email, String password) async {
    // if (!await networkStatus.isConnected) {
    //   return Left(
    //     UserFailure(
    //       LocaleKeys.connectivityException.tr(),
    //     ),
    //   );
    // }

    return dataSource.signIn(email, password);
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserInfo>> signUp(
      {required String name,
      required String email,
      required String password,
      String? phoneNumber,
      String? avatar,
      required DateTime birthday}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
