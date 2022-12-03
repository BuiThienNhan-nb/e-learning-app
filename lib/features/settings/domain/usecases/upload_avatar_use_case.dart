import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/settings/domain/repositories/update_avatar_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/base_use_case.dart';

@lazySingleton
class UpdateAvatarUseCase extends UseCase<bool, UpdateAvatarParams> {
  final UpdateAvatarRepository _repository;

  UpdateAvatarUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(UpdateAvatarParams params) async =>
      _repository.updateAvatar(params.path);
}

class UpdateAvatarParams extends Equatable {
  final String path;

  const UpdateAvatarParams(this.path);

  @override
  List<Object?> get props => [path];
}
