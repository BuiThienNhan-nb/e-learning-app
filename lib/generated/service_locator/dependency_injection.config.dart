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
import '../../core/platform/network_status.dart' as _i28;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i12;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i14;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i50;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i53;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i49;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i52;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i51;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i54;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i72;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i13;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i15;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i41;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i40;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i42;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i66;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i67;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i35;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i38;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i37;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i39;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i69;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i36;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i9;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i10;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i44;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i47;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i43;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i46;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i45;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i48;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i70;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i71;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i17;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i18;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i59;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i62;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i58;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i61;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i60;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i63;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i73;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i74;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i16;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i56;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i55;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i30;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i57;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i65;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i64;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i19;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i20;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i11;
import '../../features/my_courses/presentation/states/provider/my_courses_provider.dart'
    as _i27;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i31;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i33;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i32;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i34;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i68;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i29;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i8;
import '../../utils/mock/mock_course_reviews.dart' as _i21;
import '../../utils/mock/mock_courses.dart' as _i22;
import '../../utils/mock/mock_faq.dart' as _i23;
import '../../utils/mock/mock_teacher_reviews.dart' as _i24;
import '../../utils/mock/mock_teachers.dart' as _i25;
import '../../utils/mock/mock_transactions.dart'
    as _i26; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.CourseDetailDataSource>(
      () => _i9.CourseDetailDataSourceImp());
  gh.lazySingleton<_i10.CourseRateDataSource>(
      () => _i10.CourseRateDataSourceImp());
  gh.factory<_i11.CreateCourseProvider>(() => _i11.CreateCourseProvider());
  gh.lazySingleton<_i12.ForgotPasswordDataSource>(
      () => _i12.ForgotPasswordDataSourceImp());
  gh.factory<_i13.ForgotPasswordPageProvider>(
      () => _i13.ForgotPasswordPageProvider());
  gh.lazySingleton<_i14.GetForgotPasswordCodeDataSource>(
      () => _i14.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i15.GetForgotPasswordCodeProvider>(
      () => _i15.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i16.GetLessonCommentsDataSource>(
      () => _i16.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i17.GetRecommendedCoursesDataSource>(
      () => _i17.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i18.GetTopTeachersDataSource>(
      () => _i18.GetTopTeachersDataSourceImp());
  gh.factory<_i19.LessonDetailPageProvider>(
      () => _i19.LessonDetailPageProvider());
  gh.factory<_i20.MainPageStore>(() => _i20.MainPageStore());
  gh.lazySingleton<_i21.MockCourseReviews>(() => _i21.MockCourseReviews());
  gh.lazySingleton<_i22.MockCourses>(() => _i22.MockCourses());
  gh.lazySingleton<_i23.MockFAQ>(() => _i23.MockFAQ());
  gh.lazySingleton<_i24.MockTeacherReviews>(() => _i24.MockTeacherReviews());
  gh.lazySingleton<_i25.MockTeachers>(() => _i25.MockTeachers());
  gh.lazySingleton<_i26.MockTransactions>(() => _i26.MockTransactions());
  gh.factory<_i27.MyCoursesProvider>(() => _i27.MyCoursesProvider());
  gh.factory<_i28.NetworkStatus>(() => _i28.NetworkStatusImp());
  gh.factory<_i29.SettingsPageProvider>(() => _i29.SettingsPageProvider());
  gh.factory<_i30.SocketServices>(() => _i30.SocketServices());
  gh.lazySingleton<_i31.UpdateAvatarDataSource>(
      () => _i31.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i32.UpdateAvatarRepository>(
      () => _i33.UpdateAvatarRepositoryImp(
            get<_i31.UpdateAvatarDataSource>(),
            get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i34.UpdateAvatarUseCase>(
      () => _i34.UpdateAvatarUseCase(get<_i32.UpdateAvatarRepository>()));
  gh.lazySingleton<_i35.VerifyEmailDataSource>(
      () => _i35.VerifyEmailDataSourceImp());
  gh.factory<_i36.VerifyEmailProvider>(() => _i36.VerifyEmailProvider());
  gh.lazySingleton<_i37.VerifyEmailRepository>(
      () => _i38.VerifyEmailRepositoryImp(
            get<_i35.VerifyEmailDataSource>(),
            get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i39.VerifyEmailUseCase>(
      () => _i39.VerifyEmailUseCase(get<_i37.VerifyEmailRepository>()));
  gh.lazySingleton<_i40.AuthRepository>(() => _i41.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i28.NetworkStatus>(),
      ));
  gh.lazySingleton<_i42.AuthUseCase>(
      () => _i42.AuthUseCase(get<_i40.AuthRepository>()));
  gh.lazySingleton<_i43.CourseDetailRepository>(
      () => _i44.CourseDetailRepositoryImp(
            dataSource: get<_i9.CourseDetailDataSource>(),
            networkStatus: get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i45.CourseDetailUseCases>(
      () => _i45.CourseDetailUseCases(get<_i43.CourseDetailRepository>()));
  gh.lazySingleton<_i46.CourseRateRepository>(
      () => _i47.CourseRateRepositoryImp(
            dataSource: get<_i10.CourseRateDataSource>(),
            networkStatus: get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i48.CourseRateUseCases>(
      () => _i48.CourseRateUseCases(get<_i46.CourseRateRepository>()));
  gh.lazySingleton<_i49.ForgotPasswordRepository>(
      () => _i50.ForgotPasswordRepositoryImp(
            get<_i12.ForgotPasswordDataSource>(),
            get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i51.ForgotPasswordUseCase>(
      () => _i51.ForgotPasswordUseCase(get<_i49.ForgotPasswordRepository>()));
  gh.lazySingleton<_i52.GetForgotPasswordCodeRepository>(
      () => _i53.GetForgotPasswordCodeRepositoryImp(
            get<_i14.GetForgotPasswordCodeDataSource>(),
            get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i54.GetForgotPasswordCodeUseCase>(() =>
      _i54.GetForgotPasswordCodeUseCase(
          get<_i52.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i55.GetLessonCommentsRepository>(
      () => _i56.GetLessonCommentsRepositoryImp(
            dataSource: get<_i16.GetLessonCommentsDataSource>(),
            networkStatus: get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i57.GetLessonCommentsUseCase>(() =>
      _i57.GetLessonCommentsUseCase(get<_i55.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i58.GetRecommendedCoursesRepository>(
      () => _i59.GetRecommendedCoursesRepositoryImp(
            get<_i17.GetRecommendedCoursesDataSource>(),
            get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i60.GetRecommendedCoursesUseCase>(() =>
      _i60.GetRecommendedCoursesUseCase(
          get<_i58.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i61.GetTopTeachersRepository>(
      () => _i62.GetTopTeachersRepositoryImp(
            get<_i18.GetTopTeachersDataSource>(),
            get<_i28.NetworkStatus>(),
          ));
  gh.lazySingleton<_i63.GetTopTeachersUseCase>(
      () => _i63.GetTopTeachersUseCase(get<_i61.GetTopTeachersRepository>()));
  gh.factory<_i64.LessonCommentsStore>(
      () => _i64.LessonCommentsStore(get<_i57.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i65.LessonDetailUseCase>(
      () => _i65.LessonDetailUseCase(get<_i55.GetLessonCommentsRepository>()));
  gh.factory<_i66.SignInStore>(() => _i66.SignInStore(get<_i42.AuthUseCase>()));
  gh.factory<_i67.SignUpStore>(() => _i67.SignUpStore(get<_i42.AuthUseCase>()));
  gh.factory<_i68.UpdateAvatarStore>(
      () => _i68.UpdateAvatarStore(get<_i34.UpdateAvatarUseCase>()));
  gh.factory<_i69.VerifyEmailStore>(
      () => _i69.VerifyEmailStore(get<_i39.VerifyEmailUseCase>()));
  gh.factory<_i70.CourseDetailStore>(
      () => _i70.CourseDetailStore(get<_i45.CourseDetailUseCases>()));
  gh.factory<_i71.CourseRateStore>(
      () => _i71.CourseRateStore(get<_i48.CourseRateUseCases>()));
  gh.factory<_i72.ForgotPasswordStore>(() => _i72.ForgotPasswordStore(
        get<_i51.ForgotPasswordUseCase>(),
        get<_i54.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i73.GetRecommendedCoursesStore>(() =>
      _i73.GetRecommendedCoursesStore(
          get<_i60.GetRecommendedCoursesUseCase>()));
  gh.factory<_i74.GetTopTeachersStore>(
      () => _i74.GetTopTeachersStore(get<_i63.GetTopTeachersUseCase>()));
  return get;
}
