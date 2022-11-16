// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../bases/presentation/atoms/bottom_nav_bar.dart' as _i7;
import '../../configs/routes.dart' as _i4;
import '../../core/app/provider.dart' as _i3;
import '../../core/platform/network_status.dart' as _i16;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i8;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i21;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i20;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i22;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i9;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i18;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i17;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i19;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i29;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i30;
import '../../features/home/data/datasources/get_rcm_lesson_data_source.dart'
    as _i10;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i11;
import '../../features/home/data/repositories/get_rcm_lesson_repository_imp.dart'
    as _i24;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i27;
import '../../features/home/domain/repositories/get_rcm_lessons_repository.dart'
    as _i23;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i26;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_lesson_use_case.dart'
    as _i25;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i28;
import '../../features/home/presentation/states/lesson/get_rcm_lessons_store.dart'
    as _i31;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i32;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i12;
import '../../utils/mock/mock_course_reviews.dart' as _i13;
import '../../utils/mock/mock_courses.dart' as _i14;
import '../../utils/mock/mock_teachers.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i4.AppRoutes>(() => _i4.AppRoutes());
  gh.factory<_i5.AuthPageProvider>(() => _i5.AuthPageProvider());
  gh.lazySingleton<_i6.AuthRemoteDataSource>(
      () => _i6.AuthRemoteDataSourceImp());
  gh.lazySingleton<_i7.BottomNavigationBarConfig>(
      () => _i7.BottomNavigationBarConfig());
  gh.lazySingleton<_i8.ForgotPasswordDataSource>(
      () => _i8.ForgotPasswordDataSourceImp());
  gh.lazySingleton<_i9.ForgotPasswordPageProvider>(
      () => _i9.ForgotPasswordPageProvider());
  gh.lazySingleton<_i10.GetRecommendedLessonsDataSource>(
      () => _i10.GetRecommendedLessonDataSourceImp());
  gh.lazySingleton<_i11.GetTopTeachersDataSource>(
      () => _i11.GetTopTeachersDataSourceImp());
  gh.factory<_i12.MainPageStore>(() => _i12.MainPageStore());
  gh.lazySingleton<_i13.MockCourseReviews>(() => _i13.MockCourseReviews());
  gh.lazySingleton<_i14.MockCourses>(() => _i14.MockCourses());
  gh.lazySingleton<_i15.MockTeachers>(() => _i15.MockTeachers());
  gh.factory<_i16.NetworkStatus>(() => _i16.NetworkStatusImp());
  gh.lazySingleton<_i17.AuthRepository>(() => _i18.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i16.NetworkStatus>(),
      ));
  gh.lazySingleton<_i19.AuthUseCase>(
      () => _i19.AuthUseCase(get<_i17.AuthRepository>()));
  gh.lazySingleton<_i20.ForgotPasswordRepository>(
      () => _i21.ForgotPasswordRepositoryImp(
            get<_i8.ForgotPasswordDataSource>(),
            get<_i16.NetworkStatus>(),
          ));
  gh.lazySingleton<_i22.ForgotPasswordUseCase>(
      () => _i22.ForgotPasswordUseCase(get<_i20.ForgotPasswordRepository>()));
  gh.lazySingleton<_i23.GetRecommendedLessonsRepository>(
      () => _i24.GetRecommendedLessonsRepositoryImp(
            get<_i10.GetRecommendedLessonsDataSource>(),
            get<_i16.NetworkStatus>(),
          ));
  gh.lazySingleton<_i25.GetRecommendedLessonsUseCase>(() =>
      _i25.GetRecommendedLessonsUseCase(
          get<_i23.GetRecommendedLessonsRepository>()));
  gh.lazySingleton<_i26.GetTopTeachersRepository>(
      () => _i27.GetTopTeachersRepositoryImp(
            get<_i11.GetTopTeachersDataSource>(),
            get<_i16.NetworkStatus>(),
          ));
  gh.lazySingleton<_i28.GetTopTeachersUseCase>(
      () => _i28.GetTopTeachersUseCase(get<_i26.GetTopTeachersRepository>()));
  gh.factory<_i29.SignInStore>(() => _i29.SignInStore(get<_i19.AuthUseCase>()));
  gh.factory<_i30.SignUpStore>(() => _i30.SignUpStore(get<_i19.AuthUseCase>()));
  gh.factory<_i31.GetRecommendedLessonsStore>(() =>
      _i31.GetRecommendedLessonsStore(
          get<_i25.GetRecommendedLessonsUseCase>()));
  gh.factory<_i32.GetTopTeachersStore>(
      () => _i32.GetTopTeachersStore(get<_i28.GetTopTeachersUseCase>()));
  return get;
}
