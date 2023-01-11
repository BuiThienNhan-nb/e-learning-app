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
import '../../core/platform/network_status.dart' as _i30;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i13;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i15;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i69;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i72;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i68;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i71;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i70;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i73;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i102;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i14;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i16;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i56;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i55;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i57;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i92;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i93;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i50;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i53;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i52;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i54;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i97;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i51;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i9;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i10;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i59;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i62;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i58;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i61;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i60;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i63;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i98;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i99;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i12;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i66;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i65;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i67;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i101;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i18;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i19;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i78;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i81;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i77;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i80;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i79;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i82;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i103;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i104;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i17;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i75;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i74;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i36;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i76;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i84;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i83;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i20;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i21;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i86;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i85;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i87;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i105;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i22;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i29;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i89;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i88;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i90;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i100;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i106;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i96;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i11;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i45;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i31;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i41;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i46;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i33;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i43;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i48;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i32;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i42;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i47;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i34;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i49;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i44;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i64;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i91;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i95;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i35;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i8;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i37;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i39;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i38;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i40;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i94;
import '../../utils/mock/mock_course_reviews.dart' as _i23;
import '../../utils/mock/mock_courses.dart' as _i24;
import '../../utils/mock/mock_faq.dart' as _i25;
import '../../utils/mock/mock_teacher_reviews.dart' as _i26;
import '../../utils/mock/mock_teachers.dart' as _i27;
import '../../utils/mock/mock_transactions.dart'
    as _i28; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i12.EnrolledCourseDataSource>(
      () => _i12.EnrolledCourseDataSourceImp());
  gh.lazySingleton<_i13.ForgotPasswordDataSource>(
      () => _i13.ForgotPasswordDataSourceImp());
  gh.factory<_i14.ForgotPasswordPageProvider>(
      () => _i14.ForgotPasswordPageProvider());
  gh.lazySingleton<_i15.GetForgotPasswordCodeDataSource>(
      () => _i15.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i16.GetForgotPasswordCodeProvider>(
      () => _i16.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i17.GetLessonCommentsDataSource>(
      () => _i17.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i18.GetRecommendedCoursesDataSource>(
      () => _i18.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i19.GetTopTeachersDataSource>(
      () => _i19.GetTopTeachersDataSourceImp());
  gh.factory<_i20.LessonDetailPageProvider>(
      () => _i20.LessonDetailPageProvider());
  gh.lazySingleton<_i21.LiveStreamDataSource>(
      () => _i21.LiveStreamDataSourceImp());
  gh.factory<_i22.MainPageStore>(() => _i22.MainPageStore());
  gh.lazySingleton<_i23.MockCourseReviews>(() => _i23.MockCourseReviews());
  gh.lazySingleton<_i24.MockCourses>(() => _i24.MockCourses());
  gh.lazySingleton<_i25.MockFAQ>(() => _i25.MockFAQ());
  gh.lazySingleton<_i26.MockTeacherReviews>(() => _i26.MockTeacherReviews());
  gh.lazySingleton<_i27.MockTeachers>(() => _i27.MockTeachers());
  gh.lazySingleton<_i28.MockTransactions>(() => _i28.MockTransactions());
  gh.lazySingleton<_i29.MyCourseDataSource>(() => _i29.MyCourseDataSourceImp());
  gh.factory<_i30.NetworkStatus>(() => _i30.NetworkStatusImp());
  gh.lazySingleton<_i31.PaymentDataSource>(() => _i31.PaymentDataSourceImp());
  gh.lazySingleton<_i32.PaymentRepository>(() => _i33.PaymentRepositoryImp(
        get<_i31.PaymentDataSource>(),
        get<_i30.NetworkStatus>(),
      ));
  gh.lazySingleton<_i34.PaymentUseCases>(
      () => _i34.PaymentUseCases(get<_i32.PaymentRepository>()));
  gh.factory<_i35.SettingsPageProvider>(() => _i35.SettingsPageProvider());
  gh.factory<_i36.SocketServices>(() => _i36.SocketServices());
  gh.lazySingleton<_i37.TeacherDetailDataSource>(
      () => _i37.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i38.TeacherDetailRepository>(
      () => _i39.TeacherDetailRepositoryImp(
            get<_i30.NetworkStatus>(),
            get<_i37.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i40.TeacherDetailUseCase>(
      () => _i40.TeacherDetailUseCase(get<_i38.TeacherDetailRepository>()));
  gh.lazySingleton<_i41.UpdateAvatarDataSource>(
      () => _i41.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i42.UpdateAvatarRepository>(
      () => _i43.UpdateAvatarRepositoryImp(
            get<_i41.UpdateAvatarDataSource>(),
            get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i44.UpdateAvatarUseCase>(
      () => _i44.UpdateAvatarUseCase(get<_i42.UpdateAvatarRepository>()));
  gh.factory<_i45.UpdateCourseProvider>(() => _i45.UpdateCourseProvider());
  gh.lazySingleton<_i46.UpdateProfileDataSource>(
      () => _i46.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i47.UpdateProfileRepository>(
      () => _i48.UpdateProfileRepositoryImp(
            get<_i46.UpdateProfileDataSource>(),
            get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i49.UpdateProfileUseCase>(
      () => _i49.UpdateProfileUseCase(get<_i47.UpdateProfileRepository>()));
  gh.lazySingleton<_i50.VerifyEmailDataSource>(
      () => _i50.VerifyEmailDataSourceImp());
  gh.factory<_i51.VerifyEmailProvider>(() => _i51.VerifyEmailProvider());
  gh.lazySingleton<_i52.VerifyEmailRepository>(
      () => _i53.VerifyEmailRepositoryImp(
            get<_i50.VerifyEmailDataSource>(),
            get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i54.VerifyEmailUseCase>(
      () => _i54.VerifyEmailUseCase(get<_i52.VerifyEmailRepository>()));
  gh.lazySingleton<_i55.AuthRepository>(() => _i56.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i30.NetworkStatus>(),
      ));
  gh.lazySingleton<_i57.AuthUseCase>(
      () => _i57.AuthUseCase(get<_i55.AuthRepository>()));
  gh.lazySingleton<_i58.CourseDetailRepository>(
      () => _i59.CourseDetailRepositoryImp(
            dataSource: get<_i9.CourseDetailDataSource>(),
            networkStatus: get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i60.CourseDetailUseCases>(
      () => _i60.CourseDetailUseCases(get<_i58.CourseDetailRepository>()));
  gh.lazySingleton<_i61.CourseRateRepository>(
      () => _i62.CourseRateRepositoryImp(
            dataSource: get<_i10.CourseRateDataSource>(),
            networkStatus: get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i63.CourseRateUseCases>(
      () => _i63.CourseRateUseCases(get<_i61.CourseRateRepository>()));
  gh.factory<_i64.EditProfileStore>(
      () => _i64.EditProfileStore(get<_i49.UpdateProfileUseCase>()));
  gh.lazySingleton<_i65.EnrolledCourseRepository>(
      () => _i66.EnrolledCourseRepositoryImp(
            get<_i30.NetworkStatus>(),
            get<_i12.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i67.EnrolledCourseUseCase>(
      () => _i67.EnrolledCourseUseCase(get<_i65.EnrolledCourseRepository>()));
  gh.lazySingleton<_i68.ForgotPasswordRepository>(
      () => _i69.ForgotPasswordRepositoryImp(
            get<_i13.ForgotPasswordDataSource>(),
            get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i70.ForgotPasswordUseCase>(
      () => _i70.ForgotPasswordUseCase(get<_i68.ForgotPasswordRepository>()));
  gh.lazySingleton<_i71.GetForgotPasswordCodeRepository>(
      () => _i72.GetForgotPasswordCodeRepositoryImp(
            get<_i15.GetForgotPasswordCodeDataSource>(),
            get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i73.GetForgotPasswordCodeUseCase>(() =>
      _i73.GetForgotPasswordCodeUseCase(
          get<_i71.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i74.GetLessonCommentsRepository>(
      () => _i75.GetLessonCommentsRepositoryImp(
            dataSource: get<_i17.GetLessonCommentsDataSource>(),
            networkStatus: get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i76.GetLessonCommentsUseCase>(() =>
      _i76.GetLessonCommentsUseCase(get<_i74.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i77.GetRecommendedCoursesRepository>(
      () => _i78.GetRecommendedCoursesRepositoryImp(
            get<_i18.GetRecommendedCoursesDataSource>(),
            get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i79.GetRecommendedCoursesUseCase>(() =>
      _i79.GetRecommendedCoursesUseCase(
          get<_i77.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i80.GetTopTeachersRepository>(
      () => _i81.GetTopTeachersRepositoryImp(
            get<_i19.GetTopTeachersDataSource>(),
            get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i82.GetTopTeachersUseCase>(
      () => _i82.GetTopTeachersUseCase(get<_i80.GetTopTeachersRepository>()));
  gh.factory<_i83.LessonCommentsStore>(
      () => _i83.LessonCommentsStore(get<_i76.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i84.LessonDetailUseCase>(
      () => _i84.LessonDetailUseCase(get<_i74.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i85.LiveStreamRepository>(
      () => _i86.LiveStreamRepositoryImp(
            dataSource: get<_i21.LiveStreamDataSource>(),
            networkStatus: get<_i30.NetworkStatus>(),
          ));
  gh.lazySingleton<_i87.LiveStreamUseCases>(
      () => _i87.LiveStreamUseCases(get<_i85.LiveStreamRepository>()));
  gh.lazySingleton<_i88.MyCourseRepository>(() => _i89.MyCourseRepositoryImp(
        get<_i29.MyCourseDataSource>(),
        get<_i30.NetworkStatus>(),
      ));
  gh.lazySingleton<_i90.MyCourseUseCase>(() => _i90.MyCourseUseCase(
        get<_i88.MyCourseRepository>(),
        get<_i58.CourseDetailRepository>(),
      ));
  gh.factory<_i91.PaymentStore>(
      () => _i91.PaymentStore(get<_i34.PaymentUseCases>()));
  gh.factory<_i92.SignInStore>(() => _i92.SignInStore(get<_i57.AuthUseCase>()));
  gh.factory<_i93.SignUpStore>(() => _i93.SignUpStore(get<_i57.AuthUseCase>()));
  gh.factory<_i94.TeacherDetailStore>(
      () => _i94.TeacherDetailStore(get<_i40.TeacherDetailUseCase>()));
  gh.factory<_i95.UpdateAvatarStore>(
      () => _i95.UpdateAvatarStore(get<_i44.UpdateAvatarUseCase>()));
  gh.factory<_i96.UpdateCourseStore>(
      () => _i96.UpdateCourseStore(get<_i90.MyCourseUseCase>()));
  gh.factory<_i97.VerifyEmailStore>(
      () => _i97.VerifyEmailStore(get<_i54.VerifyEmailUseCase>()));
  gh.factory<_i98.CourseDetailStore>(
      () => _i98.CourseDetailStore(get<_i60.CourseDetailUseCases>()));
  gh.factory<_i99.CourseRateStore>(
      () => _i99.CourseRateStore(get<_i63.CourseRateUseCases>()));
  gh.factory<_i100.CreateCourseStore>(
      () => _i100.CreateCourseStore(get<_i90.MyCourseUseCase>()));
  gh.factory<_i101.EnrolledCourseStore>(
      () => _i101.EnrolledCourseStore(get<_i67.EnrolledCourseUseCase>()));
  gh.factory<_i102.ForgotPasswordStore>(() => _i102.ForgotPasswordStore(
        get<_i70.ForgotPasswordUseCase>(),
        get<_i73.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i103.GetRecommendedCoursesStore>(() =>
      _i103.GetRecommendedCoursesStore(
          get<_i79.GetRecommendedCoursesUseCase>()));
  gh.factory<_i104.GetTopTeachersStore>(
      () => _i104.GetTopTeachersStore(get<_i82.GetTopTeachersUseCase>()));
  gh.factory<_i105.LiveStreamStore>(
      () => _i105.LiveStreamStore(get<_i87.LiveStreamUseCases>()));
  gh.factory<_i106.MyCourseStore>(
      () => _i106.MyCourseStore(get<_i90.MyCourseUseCase>()));
  return get;
}
