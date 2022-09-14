import 'package:e_learning_app/features/auth/presentation/state/mobx/auth_store.dart';
import 'package:e_learning_app/features/auth/presentation/state/provider/auth_page_provider.dart';

import '../../../../../core/injection/injection_container.dart';
import '../../../data/datasources/auth_remote_data_source.dart';
import '../../../data/repositories/auth_repository_imp.dart';
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

    getIt.registerLazySingleton<AuthStore>(
      () => AuthStore(
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
