import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/repositories/update_avatar_repository.dart';
import '../datasources/update_avatar_data_source.dart';

@LazySingleton(as: UpdateAvatarRepository)
class UpdateAvatarRepositoryImp implements UpdateAvatarRepository {
  final UpdateAvatarDataSource dataSource;
  final NetworkStatus networkStatus;

  UpdateAvatarRepositoryImp(
    this.dataSource,
    this.networkStatus,
  );

  @override
  Future<Either<Failure, bool>> updateAvatar(String path) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.updateAvatar(path);
  }
}
