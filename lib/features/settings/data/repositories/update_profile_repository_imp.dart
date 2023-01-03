import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../auth/sign_in/domain/entities/user_model.dart';
import '../../domain/repositories/update_profile_repository.dart';
import '../datasources/update_profile_data_source.dart';

@LazySingleton(as: UpdateProfileRepository)
class UpdateProfileRepositoryImp implements UpdateProfileRepository {
  final UpdateProfileDataSource dataSource;
  final NetworkStatus networkStatus;

  UpdateProfileRepositoryImp(
    this.dataSource,
    this.networkStatus,
  );

  @override
  Future<Either<Failure, UserModel>> updateProfile(UserModel user) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.updateProfile(user);
  }
}
