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
import '../../core/platform/network_status.dart' as _i31;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i14;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i16;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i70;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i73;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i69;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i72;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i71;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i74;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i103;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i15;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i17;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i57;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i56;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i58;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i93;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i94;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i51;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i54;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i53;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i55;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i98;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i52;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i9;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i10;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i60;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i63;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i59;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i62;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i61;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i64;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i99;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i100;
import '../../features/create_exam/presentation/states/create_exam_provider.dart'
    as _i12;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i13;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i67;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i66;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i68;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i102;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i19;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i20;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i79;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i82;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i78;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i81;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i80;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i83;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i104;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i105;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i18;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i76;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i75;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i37;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i77;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i85;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i84;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i21;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i22;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i87;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i86;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i88;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i106;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i23;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i30;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i90;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i89;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i91;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i101;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i107;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i97;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i11;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i46;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i32;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i42;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i47;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i34;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i44;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i49;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i33;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i43;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i48;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i35;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i50;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i45;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i65;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i92;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i96;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i36;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i8;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i38;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i40;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i39;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i41;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i95;
import '../../utils/mock/mock_course_reviews.dart' as _i24;
import '../../utils/mock/mock_courses.dart' as _i25;
import '../../utils/mock/mock_faq.dart' as _i26;
import '../../utils/mock/mock_teacher_reviews.dart' as _i27;
import '../../utils/mock/mock_teachers.dart' as _i28;
import '../../utils/mock/mock_transactions.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i12.CreateExamProvider>(() => _i12.CreateExamProvider());
  gh.lazySingleton<_i13.EnrolledCourseDataSource>(
      () => _i13.EnrolledCourseDataSourceImp());
  gh.lazySingleton<_i14.ForgotPasswordDataSource>(
      () => _i14.ForgotPasswordDataSourceImp());
  gh.factory<_i15.ForgotPasswordPageProvider>(
      () => _i15.ForgotPasswordPageProvider());
  gh.lazySingleton<_i16.GetForgotPasswordCodeDataSource>(
      () => _i16.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i17.GetForgotPasswordCodeProvider>(
      () => _i17.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i18.GetLessonCommentsDataSource>(
      () => _i18.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i19.GetRecommendedCoursesDataSource>(
      () => _i19.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i20.GetTopTeachersDataSource>(
      () => _i20.GetTopTeachersDataSourceImp());
  gh.factory<_i21.LessonDetailPageProvider>(
      () => _i21.LessonDetailPageProvider());
  gh.lazySingleton<_i22.LiveStreamDataSource>(
      () => _i22.LiveStreamDataSourceImp());
  gh.factory<_i23.MainPageStore>(() => _i23.MainPageStore());
  gh.lazySingleton<_i24.MockCourseReviews>(() => _i24.MockCourseReviews());
  gh.lazySingleton<_i25.MockCourses>(() => _i25.MockCourses());
  gh.lazySingleton<_i26.MockFAQ>(() => _i26.MockFAQ());
  gh.lazySingleton<_i27.MockTeacherReviews>(() => _i27.MockTeacherReviews());
  gh.lazySingleton<_i28.MockTeachers>(() => _i28.MockTeachers());
  gh.lazySingleton<_i29.MockTransactions>(() => _i29.MockTransactions());
  gh.lazySingleton<_i30.MyCourseDataSource>(() => _i30.MyCourseDataSourceImp());
  gh.factory<_i31.NetworkStatus>(() => _i31.NetworkStatusImp());
  gh.lazySingleton<_i32.PaymentDataSource>(() => _i32.PaymentDataSourceImp());
  gh.lazySingleton<_i33.PaymentRepository>(() => _i34.PaymentRepositoryImp(
        get<_i32.PaymentDataSource>(),
        get<_i31.NetworkStatus>(),
      ));
  gh.lazySingleton<_i35.PaymentUseCases>(
      () => _i35.PaymentUseCases(get<_i33.PaymentRepository>()));
  gh.factory<_i36.SettingsPageProvider>(() => _i36.SettingsPageProvider());
  gh.factory<_i37.SocketServices>(() => _i37.SocketServices());
  gh.lazySingleton<_i38.TeacherDetailDataSource>(
      () => _i38.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i39.TeacherDetailRepository>(
      () => _i40.TeacherDetailRepositoryImp(
            get<_i31.NetworkStatus>(),
            get<_i38.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i41.TeacherDetailUseCase>(
      () => _i41.TeacherDetailUseCase(get<_i39.TeacherDetailRepository>()));
  gh.lazySingleton<_i42.UpdateAvatarDataSource>(
      () => _i42.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i43.UpdateAvatarRepository>(
      () => _i44.UpdateAvatarRepositoryImp(
            get<_i42.UpdateAvatarDataSource>(),
            get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i45.UpdateAvatarUseCase>(
      () => _i45.UpdateAvatarUseCase(get<_i43.UpdateAvatarRepository>()));
  gh.factory<_i46.UpdateCourseProvider>(() => _i46.UpdateCourseProvider());
  gh.lazySingleton<_i47.UpdateProfileDataSource>(
      () => _i47.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i48.UpdateProfileRepository>(
      () => _i49.UpdateProfileRepositoryImp(
            get<_i47.UpdateProfileDataSource>(),
            get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i50.UpdateProfileUseCase>(
      () => _i50.UpdateProfileUseCase(get<_i48.UpdateProfileRepository>()));
  gh.lazySingleton<_i51.VerifyEmailDataSource>(
      () => _i51.VerifyEmailDataSourceImp());
  gh.factory<_i52.VerifyEmailProvider>(() => _i52.VerifyEmailProvider());
  gh.lazySingleton<_i53.VerifyEmailRepository>(
      () => _i54.VerifyEmailRepositoryImp(
            get<_i51.VerifyEmailDataSource>(),
            get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i55.VerifyEmailUseCase>(
      () => _i55.VerifyEmailUseCase(get<_i53.VerifyEmailRepository>()));
  gh.lazySingleton<_i56.AuthRepository>(() => _i57.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i31.NetworkStatus>(),
      ));
  gh.lazySingleton<_i58.AuthUseCase>(
      () => _i58.AuthUseCase(get<_i56.AuthRepository>()));
  gh.lazySingleton<_i59.CourseDetailRepository>(
      () => _i60.CourseDetailRepositoryImp(
            dataSource: get<_i9.CourseDetailDataSource>(),
            networkStatus: get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i61.CourseDetailUseCases>(
      () => _i61.CourseDetailUseCases(get<_i59.CourseDetailRepository>()));
  gh.lazySingleton<_i62.CourseRateRepository>(
      () => _i63.CourseRateRepositoryImp(
            dataSource: get<_i10.CourseRateDataSource>(),
            networkStatus: get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i64.CourseRateUseCases>(
      () => _i64.CourseRateUseCases(get<_i62.CourseRateRepository>()));
  gh.factory<_i65.EditProfileStore>(
      () => _i65.EditProfileStore(get<_i50.UpdateProfileUseCase>()));
  gh.lazySingleton<_i66.EnrolledCourseRepository>(
      () => _i67.EnrolledCourseRepositoryImp(
            get<_i31.NetworkStatus>(),
            get<_i13.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i68.EnrolledCourseUseCase>(
      () => _i68.EnrolledCourseUseCase(get<_i66.EnrolledCourseRepository>()));
  gh.lazySingleton<_i69.ForgotPasswordRepository>(
      () => _i70.ForgotPasswordRepositoryImp(
            get<_i14.ForgotPasswordDataSource>(),
            get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i71.ForgotPasswordUseCase>(
      () => _i71.ForgotPasswordUseCase(get<_i69.ForgotPasswordRepository>()));
  gh.lazySingleton<_i72.GetForgotPasswordCodeRepository>(
      () => _i73.GetForgotPasswordCodeRepositoryImp(
            get<_i16.GetForgotPasswordCodeDataSource>(),
            get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i74.GetForgotPasswordCodeUseCase>(() =>
      _i74.GetForgotPasswordCodeUseCase(
          get<_i72.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i75.GetLessonCommentsRepository>(
      () => _i76.GetLessonCommentsRepositoryImp(
            dataSource: get<_i18.GetLessonCommentsDataSource>(),
            networkStatus: get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i77.GetLessonCommentsUseCase>(() =>
      _i77.GetLessonCommentsUseCase(get<_i75.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i78.GetRecommendedCoursesRepository>(
      () => _i79.GetRecommendedCoursesRepositoryImp(
            get<_i19.GetRecommendedCoursesDataSource>(),
            get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i80.GetRecommendedCoursesUseCase>(() =>
      _i80.GetRecommendedCoursesUseCase(
          get<_i78.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i81.GetTopTeachersRepository>(
      () => _i82.GetTopTeachersRepositoryImp(
            get<_i20.GetTopTeachersDataSource>(),
            get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i83.GetTopTeachersUseCase>(
      () => _i83.GetTopTeachersUseCase(get<_i81.GetTopTeachersRepository>()));
  gh.factory<_i84.LessonCommentsStore>(
      () => _i84.LessonCommentsStore(get<_i77.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i85.LessonDetailUseCase>(
      () => _i85.LessonDetailUseCase(get<_i75.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i86.LiveStreamRepository>(
      () => _i87.LiveStreamRepositoryImp(
            dataSource: get<_i22.LiveStreamDataSource>(),
            networkStatus: get<_i31.NetworkStatus>(),
          ));
  gh.lazySingleton<_i88.LiveStreamUseCases>(
      () => _i88.LiveStreamUseCases(get<_i86.LiveStreamRepository>()));
  gh.lazySingleton<_i89.MyCourseRepository>(() => _i90.MyCourseRepositoryImp(
        get<_i30.MyCourseDataSource>(),
        get<_i31.NetworkStatus>(),
      ));
  gh.lazySingleton<_i91.MyCourseUseCase>(() => _i91.MyCourseUseCase(
        get<_i89.MyCourseRepository>(),
        get<_i59.CourseDetailRepository>(),
      ));
  gh.factory<_i92.PaymentStore>(
      () => _i92.PaymentStore(get<_i35.PaymentUseCases>()));
  gh.factory<_i93.SignInStore>(() => _i93.SignInStore(get<_i58.AuthUseCase>()));
  gh.factory<_i94.SignUpStore>(() => _i94.SignUpStore(get<_i58.AuthUseCase>()));
  gh.factory<_i95.TeacherDetailStore>(
      () => _i95.TeacherDetailStore(get<_i41.TeacherDetailUseCase>()));
  gh.factory<_i96.UpdateAvatarStore>(
      () => _i96.UpdateAvatarStore(get<_i45.UpdateAvatarUseCase>()));
  gh.factory<_i97.UpdateCourseStore>(
      () => _i97.UpdateCourseStore(get<_i91.MyCourseUseCase>()));
  gh.factory<_i98.VerifyEmailStore>(
      () => _i98.VerifyEmailStore(get<_i55.VerifyEmailUseCase>()));
  gh.factory<_i99.CourseDetailStore>(
      () => _i99.CourseDetailStore(get<_i61.CourseDetailUseCases>()));
  gh.factory<_i100.CourseRateStore>(
      () => _i100.CourseRateStore(get<_i64.CourseRateUseCases>()));
  gh.factory<_i101.CreateCourseStore>(
      () => _i101.CreateCourseStore(get<_i91.MyCourseUseCase>()));
  gh.factory<_i102.EnrolledCourseStore>(
      () => _i102.EnrolledCourseStore(get<_i68.EnrolledCourseUseCase>()));
  gh.factory<_i103.ForgotPasswordStore>(() => _i103.ForgotPasswordStore(
        get<_i71.ForgotPasswordUseCase>(),
        get<_i74.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i104.GetRecommendedCoursesStore>(() =>
      _i104.GetRecommendedCoursesStore(
          get<_i80.GetRecommendedCoursesUseCase>()));
  gh.factory<_i105.GetTopTeachersStore>(
      () => _i105.GetTopTeachersStore(get<_i83.GetTopTeachersUseCase>()));
  gh.factory<_i106.LiveStreamStore>(
      () => _i106.LiveStreamStore(get<_i88.LiveStreamUseCases>()));
  gh.factory<_i107.MyCourseStore>(
      () => _i107.MyCourseStore(get<_i91.MyCourseUseCase>()));
  return get;
}
