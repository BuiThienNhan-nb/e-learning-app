import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../repositories/live_stream_repository.dart';

class DeleteLiveStream extends UseCase<bool, DeleteLiveStreamParams> {
  final LiveStreamRepository _repository;

  DeleteLiveStream(this._repository);

  @override
  Future<Either<Failure, bool>> call(DeleteLiveStreamParams params) async =>
      _repository.deleteLiveStream(params.id);
}

class DeleteLiveStreamParams extends Equatable {
  final String id;

  const DeleteLiveStreamParams(this.id);

  @override
  List<Object?> get props => [id];
}
