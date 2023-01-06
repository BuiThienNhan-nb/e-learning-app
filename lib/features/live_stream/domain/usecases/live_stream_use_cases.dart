import 'package:injectable/injectable.dart';

import '../repositories/live_stream_repository.dart';
import 'create_live_stream.dart';
import 'delete_live_stream.dart';
import 'get_current_live_stream.dart';

@lazySingleton
class LiveStreamUseCases {
  final LiveStreamRepository _repository;
  late final GetCurrentLiveStream getCurrentLiveStream;
  late final CreateLiveStream createLiveStream;
  late final DeleteLiveStream deleteLiveStream;

  LiveStreamUseCases(this._repository) {
    getCurrentLiveStream = GetCurrentLiveStream(_repository);
    createLiveStream = CreateLiveStream(_repository);
    deleteLiveStream = DeleteLiveStream(_repository);
  }
}
