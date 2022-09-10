// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_learning_app/features/auth/domain/entities/user_info.dart';
import 'package:e_learning_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';

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
    if (!await networkStatus.isConnected) {
      throw UserException(LocaleKeys.connectivityException.tr());
    }
    return dataSource.signIn(email, password);
    // try {
    //   return Right(await dataSource.signIn(email, password));
    // } on ServerException catch (e) {
    //   return Left(ServerFailure(e.message));
    // }
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
