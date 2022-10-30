// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../bases/presentation/atoms/bottom_nav_bar.dart' as _i6;
import '../../core/app/provider.dart' as _i3;
import '../../core/platform/network_status.dart' as _i12;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i5;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i14;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i13;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i15;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i22;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i4;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i23;
import '../../features/home/data/datasources/get_rcm_lesson_data_source.dart'
    as _i7;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i8;
import '../../features/home/data/repositories/get_rcm_lesson_repository_imp.dart'
    as _i17;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i20;
import '../../features/home/domain/repositories/get_rcm_lessons_repository.dart'
    as _i16;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i19;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_lesson_use_case.dart'
    as _i18;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i21;
import '../../features/home/presentation/states/lesson/get_rcm_lessons_store.dart'
    as _i24;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i25;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i9;
import '../../utils/mock/mock_lessons.dart' as _i10;
import '../../utils/mock/mock_teachers.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.GetRecommendedLessonsDataSource>(
      () => _i7.GetRecommendedLessonDataSourceImp());
  gh.lazySingleton<_i8.GetTopTeachersDataSource>(
      () => _i8.GetTopTeachersDataSourceImp());
  gh.factory<_i9.MainPageStore>(() => _i9.MainPageStore());
  gh.lazySingleton<_i10.MockLessons>(() => _i10.MockLessons());
  gh.lazySingleton<_i11.MockTeachers>(() => _i11.MockTeachers());
  gh.factory<_i12.NetworkStatus>(() => _i12.NetworkStatusImp());
  gh.lazySingleton<_i13.AuthRepository>(() => _i14.AuthRepositoryImp(
        dataSource: get<_i5.AuthRemoteDataSource>(),
        networkStatus: get<_i12.NetworkStatus>(),
      ));
  gh.lazySingleton<_i15.AuthUseCase>(
      () => _i15.AuthUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i16.GetRecommendedLessonsRepository>(
      () => _i17.GetRecommendedLessonsRepositoryImp(
            get<_i7.GetRecommendedLessonsDataSource>(),
            get<_i12.NetworkStatus>(),
          ));
  gh.lazySingleton<_i18.GetRecommendedLessonsUseCase>(() =>
      _i18.GetRecommendedLessonsUseCase(
          get<_i16.GetRecommendedLessonsRepository>()));
  gh.lazySingleton<_i19.GetTopTeachersRepository>(
      () => _i20.GetTopTeachersRepositoryImp(
            get<_i8.GetTopTeachersDataSource>(),
            get<_i12.NetworkStatus>(),
          ));
  gh.lazySingleton<_i21.GetTopTeachersUseCase>(
      () => _i21.GetTopTeachersUseCase(get<_i19.GetTopTeachersRepository>()));
  gh.factory<_i22.SignInStore>(() => _i22.SignInStore(get<_i15.AuthUseCase>()));
  gh.factory<_i23.SignUpStore>(() => _i23.SignUpStore(get<_i15.AuthUseCase>()));
  gh.factory<_i24.GetRecommendedLessonsStore>(() =>
      _i24.GetRecommendedLessonsStore(
          get<_i18.GetRecommendedLessonsUseCase>()));
  gh.factory<_i25.GetTopTeachersStore>(
      () => _i25.GetTopTeachersStore(get<_i21.GetTopTeachersUseCase>()));
  return get;
}
