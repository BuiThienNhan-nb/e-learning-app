import 'package:e_learning_app/features/auth/sign_up/presentation/state/mobx/sign_up_store.dart';

import '../../../../../../core/injection/injection_container.dart';
import '../../../data/datasources/auth_remote_data_source.dart';
import '../../../data/repositories/auth_repository_imp.dart';
import '../../../presentation/state/mobx/sign_in_store.dart';
import '../../../presentation/state/provider/auth_page_provider.dart';
import '../../repositories/auth_repository.dart';
import '../auth_use_case.dart';

class AuthInjectionContainer extends InjectionContainer {
  AuthInjectionContainer._internal();

  static final AuthInjectionContainer instance =
      AuthInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<AuthPageProvider>(
      () => AuthPageProvider(),
    );

    getIt.registerLazySingleton<SignInStore>(
      () => SignInStore(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<SignUpStore>(
      () => SignUpStore(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<AuthUseCase>(
      () => AuthUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(
        dataSource: getIt(),
        networkStatus: getIt(),
      ),
    );

    getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );
  }
}
