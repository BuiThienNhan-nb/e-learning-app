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
import '../../core/platform/network_status.dart' as _i26;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i10;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i12;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i42;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i45;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i41;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i44;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i43;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i46;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i62;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i11;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i13;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i39;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i38;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i40;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i58;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i59;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i33;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i36;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i35;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i37;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i61;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i34;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i15;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i16;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i51;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i54;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i50;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i53;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i52;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i55;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i63;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i64;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i14;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i48;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i47;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i28;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i49;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i57;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i56;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i17;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i18;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i9;
import '../../features/my_courses/presentation/states/provider/my_courses_provider.dart'
    as _i25;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i29;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i31;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i30;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i32;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i60;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i27;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i8;
import '../../utils/mock/mock_course_reviews.dart' as _i19;
import '../../utils/mock/mock_courses.dart' as _i20;
import '../../utils/mock/mock_faq.dart' as _i21;
import '../../utils/mock/mock_teacher_reviews.dart' as _i22;
import '../../utils/mock/mock_teachers.dart' as _i23;
import '../../utils/mock/mock_transactions.dart'
    as _i24; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i14.GetLessonCommentsDataSource>(
      () => _i14.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i15.GetRecommendedCoursesDataSource>(
      () => _i15.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i16.GetTopTeachersDataSource>(
      () => _i16.GetTopTeachersDataSourceImp());
  gh.factory<_i17.LessonDetailPageProvider>(
      () => _i17.LessonDetailPageProvider());
  gh.factory<_i18.MainPageStore>(() => _i18.MainPageStore());
  gh.lazySingleton<_i19.MockCourseReviews>(() => _i19.MockCourseReviews());
  gh.lazySingleton<_i20.MockCourses>(() => _i20.MockCourses());
  gh.lazySingleton<_i21.MockFAQ>(() => _i21.MockFAQ());
  gh.lazySingleton<_i22.MockTeacherReviews>(() => _i22.MockTeacherReviews());
  gh.lazySingleton<_i23.MockTeachers>(() => _i23.MockTeachers());
  gh.lazySingleton<_i24.MockTransactions>(() => _i24.MockTransactions());
  gh.factory<_i25.MyCoursesProvider>(() => _i25.MyCoursesProvider());
  gh.factory<_i26.NetworkStatus>(() => _i26.NetworkStatusImp());
  gh.factory<_i27.SettingsPageProvider>(() => _i27.SettingsPageProvider());
  gh.factory<_i28.SocketServices>(() => _i28.SocketServices());
  gh.lazySingleton<_i29.UpdateAvatarDataSource>(
      () => _i29.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i30.UpdateAvatarRepository>(
      () => _i31.UpdateAvatarRepositoryImp(
            get<_i29.UpdateAvatarDataSource>(),
            get<_i26.NetworkStatus>(),
          ));
  gh.lazySingleton<_i32.UpdateAvatarUseCase>(
      () => _i32.UpdateAvatarUseCase(get<_i30.UpdateAvatarRepository>()));
  gh.lazySingleton<_i33.VerifyEmailDataSource>(
      () => _i33.VerifyEmailDataSourceImp());
  gh.factory<_i34.VerifyEmailProvider>(() => _i34.VerifyEmailProvider());
  gh.lazySingleton<_i35.VerifyEmailRepository>(
      () => _i36.VerifyEmailRepositoryImp(
            get<_i33.VerifyEmailDataSource>(),
            get<_i26.NetworkStatus>(),
          ));
  gh.lazySingleton<_i37.VerifyEmailUseCase>(
      () => _i37.VerifyEmailUseCase(get<_i35.VerifyEmailRepository>()));
  gh.lazySingleton<_i38.AuthRepository>(() => _i39.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i26.NetworkStatus>(),
      ));
  gh.lazySingleton<_i40.AuthUseCase>(
      () => _i40.AuthUseCase(get<_i38.AuthRepository>()));
  gh.lazySingleton<_i41.ForgotPasswordRepository>(
      () => _i42.ForgotPasswordRepositoryImp(
            get<_i10.ForgotPasswordDataSource>(),
            get<_i26.NetworkStatus>(),
          ));
  gh.lazySingleton<_i43.ForgotPasswordUseCase>(
      () => _i43.ForgotPasswordUseCase(get<_i41.ForgotPasswordRepository>()));
  gh.lazySingleton<_i44.GetForgotPasswordCodeRepository>(
      () => _i45.GetForgotPasswordCodeRepositoryImp(
            get<_i12.GetForgotPasswordCodeDataSource>(),
            get<_i26.NetworkStatus>(),
          ));
  gh.lazySingleton<_i46.GetForgotPasswordCodeUseCase>(() =>
      _i46.GetForgotPasswordCodeUseCase(
          get<_i44.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i47.GetLessonCommentsRepository>(
      () => _i48.GetLessonCommentsRepositoryImp(
            dataSource: get<_i14.GetLessonCommentsDataSource>(),
            networkStatus: get<_i26.NetworkStatus>(),
          ));
  gh.lazySingleton<_i49.GetLessonCommentsUseCase>(() =>
      _i49.GetLessonCommentsUseCase(get<_i47.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i50.GetRecommendedCoursesRepository>(
      () => _i51.GetRecommendedCoursesRepositoryImp(
            get<_i15.GetRecommendedCoursesDataSource>(),
            get<_i26.NetworkStatus>(),
          ));
  gh.lazySingleton<_i52.GetRecommendedCoursesUseCase>(() =>
      _i52.GetRecommendedCoursesUseCase(
          get<_i50.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i53.GetTopTeachersRepository>(
      () => _i54.GetTopTeachersRepositoryImp(
            get<_i16.GetTopTeachersDataSource>(),
            get<_i26.NetworkStatus>(),
          ));
  gh.lazySingleton<_i55.GetTopTeachersUseCase>(
      () => _i55.GetTopTeachersUseCase(get<_i53.GetTopTeachersRepository>()));
  gh.factory<_i56.LessonCommentsStore>(
      () => _i56.LessonCommentsStore(get<_i49.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i57.LessonDetailUseCase>(
      () => _i57.LessonDetailUseCase(get<_i47.GetLessonCommentsRepository>()));
  gh.factory<_i58.SignInStore>(() => _i58.SignInStore(get<_i40.AuthUseCase>()));
  gh.factory<_i59.SignUpStore>(() => _i59.SignUpStore(get<_i40.AuthUseCase>()));
  gh.factory<_i60.UpdateAvatarStore>(
      () => _i60.UpdateAvatarStore(get<_i32.UpdateAvatarUseCase>()));
  gh.factory<_i61.VerifyEmailStore>(
      () => _i61.VerifyEmailStore(get<_i37.VerifyEmailUseCase>()));
  gh.factory<_i62.ForgotPasswordStore>(() => _i62.ForgotPasswordStore(
        get<_i43.ForgotPasswordUseCase>(),
        get<_i46.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i63.GetRecommendedCoursesStore>(() =>
      _i63.GetRecommendedCoursesStore(
          get<_i52.GetRecommendedCoursesUseCase>()));
  gh.factory<_i64.GetTopTeachersStore>(
      () => _i64.GetTopTeachersStore(get<_i55.GetTopTeachersUseCase>()));
  return get;
}
