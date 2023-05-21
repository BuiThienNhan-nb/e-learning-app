import 'package:e_learning_app/features/auth/sign_in/domain/usecases/auth_use_case/get_user_by_id_use_case.dart';
import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';
import 'auth_use_case/sign_in_use_case.dart';
import 'auth_use_case/sign_out_use_case.dart';
import 'auth_use_case/sign_up_use_case.dart';

@lazySingleton
class AuthUseCase {
  final AuthRepository repository;
  late SignInUseCase signInUseCase;
  late SignUpUseCase signUpUseCase;
  late SignOutUseCase signOutUseCase;
  late GetUserByIdUseCase getUserUseCase;

  AuthUseCase(this.repository) {
    signInUseCase = SignInUseCase(repository);
    signUpUseCase = SignUpUseCase(repository);
    signOutUseCase = SignOutUseCase(repository);
    getUserUseCase = GetUserByIdUseCase(repository);
  }
}
