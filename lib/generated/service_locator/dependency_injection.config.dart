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
import '../../core/platform/network_status.dart' as _i25;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i10;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i12;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i40;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i43;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i39;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i42;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i41;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i44;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i55;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i11;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i13;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i37;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i36;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i38;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i51;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i52;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i31;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i34;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i33;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i35;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i54;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i32;
import '../../features/home/data/datasources/get_rcm_lesson_data_source.dart'
    as _i14;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i15;
import '../../features/home/data/repositories/get_rcm_lesson_repository_imp.dart'
    as _i46;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i49;
import '../../features/home/domain/repositories/get_rcm_lessons_repository.dart'
    as _i45;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i48;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_lesson_use_case.dart'
    as _i47;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i50;
import '../../features/home/presentation/states/lesson/get_rcm_lessons_store.dart'
    as _i56;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i57;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i16;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i17;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i9;
import '../../features/my_courses/presentation/states/provider/my_courses_provider.dart'
    as _i24;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i27;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i29;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i28;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i30;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i53;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i26;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i8;
import '../../utils/mock/mock_course_reviews.dart' as _i18;
import '../../utils/mock/mock_courses.dart' as _i19;
import '../../utils/mock/mock_faq.dart' as _i20;
import '../../utils/mock/mock_teacher_reviews.dart' as _i21;
import '../../utils/mock/mock_teachers.dart' as _i22;
import '../../utils/mock/mock_transactions.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.ChatProvider>(() => _i8.ChatProvider());
  gh.factory<_i9.CreateCourseProvider>(() => _i9.CreateCourseProvider());
  gh.lazySingleton<_i10.ForgotPasswordDataSource>(
      () => _i10.ForgotPasswordDataSourceImp());
  gh.factory<_i11.ForgotPasswordPageProvider>(
      () => _i11.ForgotPasswordPageProvider());
  gh.lazySingleton<_i12.GetForgotPasswordCodeDataSource>(
      () => _i12.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i13.GetForgotPasswordCodeProvider>(
      () => _i13.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i14.GetRecommendedLessonsDataSource>(
      () => _i14.GetRecommendedLessonDataSourceImp());
  gh.lazySingleton<_i15.GetTopTeachersDataSource>(
      () => _i15.GetTopTeachersDataSourceImp());
  gh.factory<_i16.LessonDetailPageProvider>(
      () => _i16.LessonDetailPageProvider());
  gh.factory<_i17.MainPageStore>(() => _i17.MainPageStore());
  gh.lazySingleton<_i18.MockCourseReviews>(() => _i18.MockCourseReviews());
  gh.lazySingleton<_i19.MockCourses>(() => _i19.MockCourses());
  gh.lazySingleton<_i20.MockFAQ>(() => _i20.MockFAQ());
  gh.lazySingleton<_i21.MockTeacherReviews>(() => _i21.MockTeacherReviews());
  gh.lazySingleton<_i22.MockTeachers>(() => _i22.MockTeachers());
  gh.lazySingleton<_i23.MockTransactions>(() => _i23.MockTransactions());
  gh.factory<_i24.MyCoursesProvider>(() => _i24.MyCoursesProvider());
  gh.factory<_i25.NetworkStatus>(() => _i25.NetworkStatusImp());
  gh.factory<_i26.SettingsPageProvider>(() => _i26.SettingsPageProvider());
  gh.lazySingleton<_i27.UpdateAvatarDataSource>(
      () => _i27.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i28.UpdateAvatarRepository>(
      () => _i29.UpdateAvatarRepositoryImp(
            get<_i27.UpdateAvatarDataSource>(),
            get<_i25.NetworkStatus>(),
          ));
  gh.lazySingleton<_i30.UpdateAvatarUseCase>(
      () => _i30.UpdateAvatarUseCase(get<_i28.UpdateAvatarRepository>()));
  gh.lazySingleton<_i31.VerifyEmailDataSource>(
      () => _i31.VerifyEmailDataSourceImp());
  gh.factory<_i32.VerifyEmailProvider>(() => _i32.VerifyEmailProvider());
  gh.lazySingleton<_i33.VerifyEmailRepository>(
      () => _i34.VerifyEmailRepositoryImp(
            get<_i31.VerifyEmailDataSource>(),
            get<_i25.NetworkStatus>(),
          ));
  gh.lazySingleton<_i35.VerifyEmailUseCase>(
      () => _i35.VerifyEmailUseCase(get<_i33.VerifyEmailRepository>()));
  gh.lazySingleton<_i36.AuthRepository>(() => _i37.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i25.NetworkStatus>(),
      ));
  gh.lazySingleton<_i38.AuthUseCase>(
      () => _i38.AuthUseCase(get<_i36.AuthRepository>()));
  gh.lazySingleton<_i39.ForgotPasswordRepository>(
      () => _i40.ForgotPasswordRepositoryImp(
            get<_i10.ForgotPasswordDataSource>(),
            get<_i25.NetworkStatus>(),
          ));
  gh.lazySingleton<_i41.ForgotPasswordUseCase>(
      () => _i41.ForgotPasswordUseCase(get<_i39.ForgotPasswordRepository>()));
  gh.lazySingleton<_i42.GetForgotPasswordCodeRepository>(
      () => _i43.GetForgotPasswordCodeRepositoryImp(
            get<_i12.GetForgotPasswordCodeDataSource>(),
            get<_i25.NetworkStatus>(),
          ));
  gh.lazySingleton<_i44.GetForgotPasswordCodeUseCase>(() =>
      _i44.GetForgotPasswordCodeUseCase(
          get<_i42.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i45.GetRecommendedLessonsRepository>(
      () => _i46.GetRecommendedLessonsRepositoryImp(
            get<_i14.GetRecommendedLessonsDataSource>(),
            get<_i25.NetworkStatus>(),
          ));
  gh.lazySingleton<_i47.GetRecommendedLessonsUseCase>(() =>
      _i47.GetRecommendedLessonsUseCase(
          get<_i45.GetRecommendedLessonsRepository>()));
  gh.lazySingleton<_i48.GetTopTeachersRepository>(
      () => _i49.GetTopTeachersRepositoryImp(
            get<_i15.GetTopTeachersDataSource>(),
            get<_i25.NetworkStatus>(),
          ));
  gh.lazySingleton<_i50.GetTopTeachersUseCase>(
      () => _i50.GetTopTeachersUseCase(get<_i48.GetTopTeachersRepository>()));
  gh.factory<_i51.SignInStore>(() => _i51.SignInStore(get<_i38.AuthUseCase>()));
  gh.factory<_i52.SignUpStore>(() => _i52.SignUpStore(get<_i38.AuthUseCase>()));
  gh.factory<_i53.UpdateAvatarStore>(
      () => _i53.UpdateAvatarStore(get<_i30.UpdateAvatarUseCase>()));
  gh.factory<_i54.VerifyEmailStore>(
      () => _i54.VerifyEmailStore(get<_i35.VerifyEmailUseCase>()));
  gh.factory<_i55.ForgotPasswordStore>(() => _i55.ForgotPasswordStore(
        get<_i41.ForgotPasswordUseCase>(),
        get<_i44.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i56.GetRecommendedLessonsStore>(() =>
      _i56.GetRecommendedLessonsStore(
          get<_i47.GetRecommendedLessonsUseCase>()));
  gh.factory<_i57.GetTopTeachersStore>(
      () => _i57.GetTopTeachersStore(get<_i50.GetTopTeachersUseCase>()));
  return get;
}
