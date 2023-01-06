import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../entities/live_stream_model.dart';
import '../repositories/live_stream_repository.dart';

class CreateLiveStream
    extends UseCase<LiveStreamModel, CreateLiveStreamParams> {
  final LiveStreamRepository _repository;

  CreateLiveStream(this._repository);

  @override
  Future<Either<Failure, LiveStreamModel>> call(
          CreateLiveStreamParams params) async =>
      _repository.createLiveStream(params.liveStreamModel);
}

class CreateLiveStreamParams extends Equatable {
  final LiveStreamModel liveStreamModel;

  const CreateLiveStreamParams(this.liveStreamModel);

  @override
  List<Object?> get props => [liveStreamModel];
}
