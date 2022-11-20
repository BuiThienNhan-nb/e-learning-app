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
import '../../core/platform/network_status.dart' as _i22;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i8;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i10;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i33;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i36;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i32;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i35;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i34;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i37;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i47;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i9;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i11;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i30;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i29;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i31;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i44;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i45;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i24;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i27;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i26;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i28;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i46;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i25;
import '../../features/home/data/datasources/get_rcm_lesson_data_source.dart'
    as _i12;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i13;
import '../../features/home/data/repositories/get_rcm_lesson_repository_imp.dart'
    as _i39;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i42;
import '../../features/home/domain/repositories/get_rcm_lessons_repository.dart'
    as _i38;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i41;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_lesson_use_case.dart'
    as _i40;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i43;
import '../../features/home/presentation/states/lesson/get_rcm_lessons_store.dart'
    as _i48;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i49;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i14;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i15;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i23;
import '../../utils/mock/mock_course_reviews.dart' as _i16;
import '../../utils/mock/mock_courses.dart' as _i17;
import '../../utils/mock/mock_faq.dart' as _i18;
import '../../utils/mock/mock_teacher_reviews.dart' as _i19;
import '../../utils/mock/mock_teachers.dart' as _i20;
import '../../utils/mock/mock_transactions.dart'
    as _i21; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i9.ForgotPasswordPageProvider>(
      () => _i9.ForgotPasswordPageProvider());
  gh.lazySingleton<_i10.GetForgotPasswordCodeDataSource>(
      () => _i10.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i11.GetForgotPasswordCodeProvider>(
      () => _i11.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i12.GetRecommendedLessonsDataSource>(
      () => _i12.GetRecommendedLessonDataSourceImp());
  gh.lazySingleton<_i13.GetTopTeachersDataSource>(
      () => _i13.GetTopTeachersDataSourceImp());
  gh.factory<_i14.LessonDetailPageProvider>(
      () => _i14.LessonDetailPageProvider());
  gh.factory<_i15.MainPageStore>(() => _i15.MainPageStore());
  gh.lazySingleton<_i16.MockCourseReviews>(() => _i16.MockCourseReviews());
  gh.lazySingleton<_i17.MockCourses>(() => _i17.MockCourses());
  gh.lazySingleton<_i18.MockFAQ>(() => _i18.MockFAQ());
  gh.lazySingleton<_i19.MockTeacherReviews>(() => _i19.MockTeacherReviews());
  gh.lazySingleton<_i20.MockTeachers>(() => _i20.MockTeachers());
  gh.lazySingleton<_i21.MockTransactions>(() => _i21.MockTransactions());
  gh.factory<_i22.NetworkStatus>(() => _i22.NetworkStatusImp());
  gh.factory<_i23.SettingsPageProvider>(() => _i23.SettingsPageProvider());
  gh.lazySingleton<_i24.VerifyEmailDataSource>(
      () => _i24.VerifyEmailDataSourceImp());
  gh.factory<_i25.VerifyEmailProvider>(() => _i25.VerifyEmailProvider());
  gh.lazySingleton<_i26.VerifyEmailRepository>(
      () => _i27.VerifyEmailRepositoryImp(
            get<_i24.VerifyEmailDataSource>(),
            get<_i22.NetworkStatus>(),
          ));
  gh.lazySingleton<_i28.VerifyEmailUseCase>(
      () => _i28.VerifyEmailUseCase(get<_i26.VerifyEmailRepository>()));
  gh.lazySingleton<_i29.AuthRepository>(() => _i30.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i22.NetworkStatus>(),
      ));
  gh.lazySingleton<_i31.AuthUseCase>(
      () => _i31.AuthUseCase(get<_i29.AuthRepository>()));
  gh.lazySingleton<_i32.ForgotPasswordRepository>(
      () => _i33.ForgotPasswordRepositoryImp(
            get<_i8.ForgotPasswordDataSource>(),
            get<_i22.NetworkStatus>(),
          ));
  gh.lazySingleton<_i34.ForgotPasswordUseCase>(
      () => _i34.ForgotPasswordUseCase(get<_i32.ForgotPasswordRepository>()));
  gh.lazySingleton<_i35.GetForgotPasswordCodeRepository>(
      () => _i36.GetForgotPasswordCodeRepositoryImp(
            get<_i10.GetForgotPasswordCodeDataSource>(),
            get<_i22.NetworkStatus>(),
          ));
  gh.lazySingleton<_i37.GetForgotPasswordCodeUseCase>(() =>
      _i37.GetForgotPasswordCodeUseCase(
          get<_i35.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i38.GetRecommendedLessonsRepository>(
      () => _i39.GetRecommendedLessonsRepositoryImp(
            get<_i12.GetRecommendedLessonsDataSource>(),
            get<_i22.NetworkStatus>(),
          ));
  gh.lazySingleton<_i40.GetRecommendedLessonsUseCase>(() =>
      _i40.GetRecommendedLessonsUseCase(
          get<_i38.GetRecommendedLessonsRepository>()));
  gh.lazySingleton<_i41.GetTopTeachersRepository>(
      () => _i42.GetTopTeachersRepositoryImp(
            get<_i13.GetTopTeachersDataSource>(),
            get<_i22.NetworkStatus>(),
          ));
  gh.lazySingleton<_i43.GetTopTeachersUseCase>(
      () => _i43.GetTopTeachersUseCase(get<_i41.GetTopTeachersRepository>()));
  gh.factory<_i44.SignInStore>(() => _i44.SignInStore(get<_i31.AuthUseCase>()));
  gh.factory<_i45.SignUpStore>(() => _i45.SignUpStore(get<_i31.AuthUseCase>()));
  gh.factory<_i46.VerifyEmailStore>(
      () => _i46.VerifyEmailStore(get<_i28.VerifyEmailUseCase>()));
  gh.factory<_i47.ForgotPasswordStore>(() => _i47.ForgotPasswordStore(
        get<_i34.ForgotPasswordUseCase>(),
        get<_i37.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i48.GetRecommendedLessonsStore>(() =>
      _i48.GetRecommendedLessonsStore(
          get<_i40.GetRecommendedLessonsUseCase>()));
  gh.factory<_i49.GetTopTeachersStore>(
      () => _i49.GetTopTeachersStore(get<_i43.GetTopTeachersUseCase>()));
  return get;
}
