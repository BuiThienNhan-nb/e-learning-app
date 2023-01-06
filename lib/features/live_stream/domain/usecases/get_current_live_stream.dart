import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../entities/live_stream_model.dart';
import '../repositories/live_stream_repository.dart';

class GetCurrentLiveStream extends UseCase<List<LiveStreamModel>, NoParams> {
  final LiveStreamRepository _repository;

  GetCurrentLiveStream(this._repository);

  @override
  Future<Either<Failure, List<LiveStreamModel>>> call(NoParams params) async =>
      _repository.getCurrentLiveStream();
}
