// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../bases/presentation/atoms/bottom_nav_bar.dart' as _i6;
import '../../core/app/provider.dart' as _i3;
import '../../core/platform/network_status.dart' as _i8;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i5;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i10;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i9;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i11;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i12;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i4;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i13;
import '../../features/main/presentation/mobx/main_page_store.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppProvider>(() => _i3.AppProvider());
  gh.lazySingleton<_i4.AuthPageProvider>(() => _i4.AuthPageProvider());
  gh.lazySingleton<_i5.AuthRemoteDataSource>(
      () => _i5.AuthRemoteDataSourceImp());
  gh.lazySingleton<_i6.BottomNavigationBarConfig>(
      () => _i6.BottomNavigationBarConfig());
  gh.factory<_i7.MainPageStore>(() => _i7.MainPageStore());
  gh.factory<_i8.NetworkStatus>(() => _i8.NetworkStatusImp());
  gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImp(
        dataSource: get<_i5.AuthRemoteDataSource>(),
        networkStatus: get<_i8.NetworkStatus>(),
      ));
  gh.lazySingleton<_i11.AuthUseCase>(
      () => _i11.AuthUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i12.SignInStore>(() => _i12.SignInStore(get<_i11.AuthUseCase>()));
  gh.factory<_i13.SignUpStore>(() => _i13.SignUpStore(get<_i11.AuthUseCase>()));
  return get;
}
