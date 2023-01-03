import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../../../auth/sign_in/domain/entities/user_model.dart';
import '../repositories/update_profile_repository.dart';

@lazySingleton
class UpdateProfileUseCase extends UseCase<UserModel, UpdateProfileParams> {
  final UpdateProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  @override
  Future<Either<Failure, UserModel>> call(UpdateProfileParams params) async =>
      _repository.updateProfile(params.user);
}

class UpdateProfileParams extends Equatable {
  final UserModel user;

  const UpdateProfileParams(this.user);

  @override
  List<Object?> get props => [user];
}
