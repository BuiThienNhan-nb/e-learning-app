import 'package:e_learning_app/features/live_stream/domain/entities/live_stream_model.dart';

import 'package:e_learning_app/core/error/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/repositories/live_stream_repository.dart';
import '../datasources/live_stream_data_source.dart';

@LazySingleton(as: LiveStreamRepository)
class LiveStreamRepositoryImp implements LiveStreamRepository {
  final LiveStreamDataSource dataSource;
  final NetworkStatus networkStatus;

  LiveStreamRepositoryImp({
    required this.dataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, LiveStreamModel>> createLiveStream(
      LiveStreamModel liveStream) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.createLiveStream(liveStream);
  }

  @override
  Future<Either<Failure, bool>> deleteLiveStream(String id) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.deleteLiveStream(id);
  }

  @override
  Future<Either<Failure, List<LiveStreamModel>>> getCurrentLiveStream() async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getCurrentLiveStream();
  }
}
