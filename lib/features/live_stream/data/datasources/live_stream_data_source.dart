import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/live_stream_model.dart';

abstract class LiveStreamDataSource {
  Future<Either<Failure, List<LiveStreamModel>>> getCurrentLiveStream();
  Future<Either<Failure, LiveStreamModel>> createLiveStream(
    LiveStreamModel liveStream,
  );
  Future<Either<Failure, bool>> deleteLiveStream(String id);
}

@LazySingleton(as: LiveStreamDataSource)
class LiveStreamDataSourceImp extends Api implements LiveStreamDataSource {
  final _createLiveStreamEndpoint = "/livestreams/create";
  final _deleteLiveStreamEndpoint = "/livestreams/delete";
  final _getCurrentLiveStreamEndpoint = "/livestreams/get";

  @override
  Future<Either<Failure, LiveStreamModel>> createLiveStream(
      LiveStreamModel liveStream) async {
    try {
      final requestData = liveStream.toMap();
      final data = await post(
        Env.instance.baseUrl + _createLiveStreamEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      LiveStreamModel returnValue = LiveStreamModel.fromMap(data["data"]);

      return Right(returnValue);
    } catch (e) {
      return Left(UserFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteLiveStream(String id) async {
    try {
      final requestData = {
        "userId": GetIt.I<AppProvider>().user.id,
      };

      final data = await post(
        Env.instance.baseUrl + _deleteLiveStreamEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );

      return Right(data["data"]["success"] ?? false);
    } catch (e) {
      return Left(UserFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LiveStreamModel>>> getCurrentLiveStream() async {
    try {
      final data = await get(
        Env.instance.baseUrl + _getCurrentLiveStreamEndpoint,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      List<LiveStreamModel> liveStreams = (data["data"]["data"] as List)
          .map(
            (map) => LiveStreamModel.fromMap(map),
          )
          .toList();
      log(liveStreams.toString());
      return Right(liveStreams);
    } catch (e) {
      return Left(UserFailure(e.toString()));
    }
  }
}
