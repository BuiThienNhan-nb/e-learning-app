import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/live_stream/domain/entities/live_stream_model.dart';

abstract class LiveStreamRepository {
  Future<Either<Failure, List<LiveStreamModel>>> getCurrentLiveStream();
  Future<Either<Failure, LiveStreamModel>> createLiveStream(
    LiveStreamModel liveStream,
  );
  Future<Either<Failure, bool>> deleteLiveStream(String id);
}
