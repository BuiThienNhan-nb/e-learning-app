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
import '../../core/platform/network_status.dart' as _i33;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i15;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i17;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i72;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i75;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i71;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i74;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i73;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i76;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i105;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i16;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i18;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i59;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i58;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i60;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i95;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i96;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i53;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i56;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i55;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i57;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i100;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i54;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i9;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i10;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i62;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i65;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i61;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i64;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i63;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i66;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i101;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i102;
import '../../features/create_exam/presentation/states/create_exam_provider.dart'
    as _i12;
import '../../features/do_exam/presentation/state/do_exam_provider.dart'
    as _i13;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i14;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i69;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i68;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i70;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i104;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i20;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i21;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i81;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i84;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i80;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i83;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i82;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i85;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i106;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i107;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i19;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i78;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i77;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i39;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i79;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i87;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i86;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i22;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i23;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i89;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i88;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i90;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i108;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i24;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i32;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i92;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i91;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i93;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i103;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i109;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i99;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i11;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i48;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i34;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i44;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i49;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i36;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i46;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i51;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i35;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i45;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i50;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i37;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i52;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i47;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i67;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i94;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i98;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i38;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i8;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i40;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i42;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i41;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i43;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i97;
import '../../utils/mock/mock_course_reviews.dart' as _i25;
import '../../utils/mock/mock_courses.dart' as _i26;
import '../../utils/mock/mock_faq.dart' as _i28;
import '../../utils/mock/mock_teacher_reviews.dart' as _i29;
import '../../utils/mock/mock_teachers.dart' as _i30;
import '../../utils/mock/mock_transactions.dart' as _i31;
import '../../utils/mock/mocl_exam.dart'
    as _i27; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i13.DoExamProvider>(() => _i13.DoExamProvider());
  gh.lazySingleton<_i14.EnrolledCourseDataSource>(
      () => _i14.EnrolledCourseDataSourceImp());
  gh.lazySingleton<_i15.ForgotPasswordDataSource>(
      () => _i15.ForgotPasswordDataSourceImp());
  gh.factory<_i16.ForgotPasswordPageProvider>(
      () => _i16.ForgotPasswordPageProvider());
  gh.lazySingleton<_i17.GetForgotPasswordCodeDataSource>(
      () => _i17.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i18.GetForgotPasswordCodeProvider>(
      () => _i18.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i19.GetLessonCommentsDataSource>(
      () => _i19.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i20.GetRecommendedCoursesDataSource>(
      () => _i20.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i21.GetTopTeachersDataSource>(
      () => _i21.GetTopTeachersDataSourceImp());
  gh.factory<_i22.LessonDetailPageProvider>(
      () => _i22.LessonDetailPageProvider());
  gh.lazySingleton<_i23.LiveStreamDataSource>(
      () => _i23.LiveStreamDataSourceImp());
  gh.factory<_i24.MainPageStore>(() => _i24.MainPageStore());
  gh.lazySingleton<_i25.MockCourseReviews>(() => _i25.MockCourseReviews());
  gh.lazySingleton<_i26.MockCourses>(() => _i26.MockCourses());
  gh.factory<_i27.MockExam>(() => _i27.MockExam());
  gh.lazySingleton<_i28.MockFAQ>(() => _i28.MockFAQ());
  gh.lazySingleton<_i29.MockTeacherReviews>(() => _i29.MockTeacherReviews());
  gh.lazySingleton<_i30.MockTeachers>(() => _i30.MockTeachers());
  gh.lazySingleton<_i31.MockTransactions>(() => _i31.MockTransactions());
  gh.lazySingleton<_i32.MyCourseDataSource>(() => _i32.MyCourseDataSourceImp());
  gh.factory<_i33.NetworkStatus>(() => _i33.NetworkStatusImp());
  gh.lazySingleton<_i34.PaymentDataSource>(() => _i34.PaymentDataSourceImp());
  gh.lazySingleton<_i35.PaymentRepository>(() => _i36.PaymentRepositoryImp(
        get<_i34.PaymentDataSource>(),
        get<_i33.NetworkStatus>(),
      ));
  gh.lazySingleton<_i37.PaymentUseCases>(
      () => _i37.PaymentUseCases(get<_i35.PaymentRepository>()));
  gh.factory<_i38.SettingsPageProvider>(() => _i38.SettingsPageProvider());
  gh.factory<_i39.SocketServices>(() => _i39.SocketServices());
  gh.lazySingleton<_i40.TeacherDetailDataSource>(
      () => _i40.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i41.TeacherDetailRepository>(
      () => _i42.TeacherDetailRepositoryImp(
            get<_i33.NetworkStatus>(),
            get<_i40.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i43.TeacherDetailUseCase>(
      () => _i43.TeacherDetailUseCase(get<_i41.TeacherDetailRepository>()));
  gh.lazySingleton<_i44.UpdateAvatarDataSource>(
      () => _i44.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i45.UpdateAvatarRepository>(
      () => _i46.UpdateAvatarRepositoryImp(
            get<_i44.UpdateAvatarDataSource>(),
            get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i47.UpdateAvatarUseCase>(
      () => _i47.UpdateAvatarUseCase(get<_i45.UpdateAvatarRepository>()));
  gh.factory<_i48.UpdateCourseProvider>(() => _i48.UpdateCourseProvider());
  gh.lazySingleton<_i49.UpdateProfileDataSource>(
      () => _i49.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i50.UpdateProfileRepository>(
      () => _i51.UpdateProfileRepositoryImp(
            get<_i49.UpdateProfileDataSource>(),
            get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i52.UpdateProfileUseCase>(
      () => _i52.UpdateProfileUseCase(get<_i50.UpdateProfileRepository>()));
  gh.lazySingleton<_i53.VerifyEmailDataSource>(
      () => _i53.VerifyEmailDataSourceImp());
  gh.factory<_i54.VerifyEmailProvider>(() => _i54.VerifyEmailProvider());
  gh.lazySingleton<_i55.VerifyEmailRepository>(
      () => _i56.VerifyEmailRepositoryImp(
            get<_i53.VerifyEmailDataSource>(),
            get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i57.VerifyEmailUseCase>(
      () => _i57.VerifyEmailUseCase(get<_i55.VerifyEmailRepository>()));
  gh.lazySingleton<_i58.AuthRepository>(() => _i59.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i33.NetworkStatus>(),
      ));
  gh.lazySingleton<_i60.AuthUseCase>(
      () => _i60.AuthUseCase(get<_i58.AuthRepository>()));
  gh.lazySingleton<_i61.CourseDetailRepository>(
      () => _i62.CourseDetailRepositoryImp(
            dataSource: get<_i9.CourseDetailDataSource>(),
            networkStatus: get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i63.CourseDetailUseCases>(
      () => _i63.CourseDetailUseCases(get<_i61.CourseDetailRepository>()));
  gh.lazySingleton<_i64.CourseRateRepository>(
      () => _i65.CourseRateRepositoryImp(
            dataSource: get<_i10.CourseRateDataSource>(),
            networkStatus: get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i66.CourseRateUseCases>(
      () => _i66.CourseRateUseCases(get<_i64.CourseRateRepository>()));
  gh.factory<_i67.EditProfileStore>(
      () => _i67.EditProfileStore(get<_i52.UpdateProfileUseCase>()));
  gh.lazySingleton<_i68.EnrolledCourseRepository>(
      () => _i69.EnrolledCourseRepositoryImp(
            get<_i33.NetworkStatus>(),
            get<_i14.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i70.EnrolledCourseUseCase>(
      () => _i70.EnrolledCourseUseCase(get<_i68.EnrolledCourseRepository>()));
  gh.lazySingleton<_i71.ForgotPasswordRepository>(
      () => _i72.ForgotPasswordRepositoryImp(
            get<_i15.ForgotPasswordDataSource>(),
            get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i73.ForgotPasswordUseCase>(
      () => _i73.ForgotPasswordUseCase(get<_i71.ForgotPasswordRepository>()));
  gh.lazySingleton<_i74.GetForgotPasswordCodeRepository>(
      () => _i75.GetForgotPasswordCodeRepositoryImp(
            get<_i17.GetForgotPasswordCodeDataSource>(),
            get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i76.GetForgotPasswordCodeUseCase>(() =>
      _i76.GetForgotPasswordCodeUseCase(
          get<_i74.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i77.GetLessonCommentsRepository>(
      () => _i78.GetLessonCommentsRepositoryImp(
            dataSource: get<_i19.GetLessonCommentsDataSource>(),
            networkStatus: get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i79.GetLessonCommentsUseCase>(() =>
      _i79.GetLessonCommentsUseCase(get<_i77.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i80.GetRecommendedCoursesRepository>(
      () => _i81.GetRecommendedCoursesRepositoryImp(
            get<_i20.GetRecommendedCoursesDataSource>(),
            get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i82.GetRecommendedCoursesUseCase>(() =>
      _i82.GetRecommendedCoursesUseCase(
          get<_i80.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i83.GetTopTeachersRepository>(
      () => _i84.GetTopTeachersRepositoryImp(
            get<_i21.GetTopTeachersDataSource>(),
            get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i85.GetTopTeachersUseCase>(
      () => _i85.GetTopTeachersUseCase(get<_i83.GetTopTeachersRepository>()));
  gh.factory<_i86.LessonCommentsStore>(
      () => _i86.LessonCommentsStore(get<_i79.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i87.LessonDetailUseCase>(
      () => _i87.LessonDetailUseCase(get<_i77.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i88.LiveStreamRepository>(
      () => _i89.LiveStreamRepositoryImp(
            dataSource: get<_i23.LiveStreamDataSource>(),
            networkStatus: get<_i33.NetworkStatus>(),
          ));
  gh.lazySingleton<_i90.LiveStreamUseCases>(
      () => _i90.LiveStreamUseCases(get<_i88.LiveStreamRepository>()));
  gh.lazySingleton<_i91.MyCourseRepository>(() => _i92.MyCourseRepositoryImp(
        get<_i32.MyCourseDataSource>(),
        get<_i33.NetworkStatus>(),
      ));
  gh.lazySingleton<_i93.MyCourseUseCase>(() => _i93.MyCourseUseCase(
        get<_i91.MyCourseRepository>(),
        get<_i61.CourseDetailRepository>(),
      ));
  gh.factory<_i94.PaymentStore>(
      () => _i94.PaymentStore(get<_i37.PaymentUseCases>()));
  gh.factory<_i95.SignInStore>(() => _i95.SignInStore(get<_i60.AuthUseCase>()));
  gh.factory<_i96.SignUpStore>(() => _i96.SignUpStore(get<_i60.AuthUseCase>()));
  gh.factory<_i97.TeacherDetailStore>(
      () => _i97.TeacherDetailStore(get<_i43.TeacherDetailUseCase>()));
  gh.factory<_i98.UpdateAvatarStore>(
      () => _i98.UpdateAvatarStore(get<_i47.UpdateAvatarUseCase>()));
  gh.factory<_i99.UpdateCourseStore>(
      () => _i99.UpdateCourseStore(get<_i93.MyCourseUseCase>()));
  gh.factory<_i100.VerifyEmailStore>(
      () => _i100.VerifyEmailStore(get<_i57.VerifyEmailUseCase>()));
  gh.factory<_i101.CourseDetailStore>(
      () => _i101.CourseDetailStore(get<_i63.CourseDetailUseCases>()));
  gh.factory<_i102.CourseRateStore>(
      () => _i102.CourseRateStore(get<_i66.CourseRateUseCases>()));
  gh.factory<_i103.CreateCourseStore>(
      () => _i103.CreateCourseStore(get<_i93.MyCourseUseCase>()));
  gh.factory<_i104.EnrolledCourseStore>(
      () => _i104.EnrolledCourseStore(get<_i70.EnrolledCourseUseCase>()));
  gh.factory<_i105.ForgotPasswordStore>(() => _i105.ForgotPasswordStore(
        get<_i73.ForgotPasswordUseCase>(),
        get<_i76.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i106.GetRecommendedCoursesStore>(() =>
      _i106.GetRecommendedCoursesStore(
          get<_i82.GetRecommendedCoursesUseCase>()));
  gh.factory<_i107.GetTopTeachersStore>(
      () => _i107.GetTopTeachersStore(get<_i85.GetTopTeachersUseCase>()));
  gh.factory<_i108.LiveStreamStore>(
      () => _i108.LiveStreamStore(get<_i90.LiveStreamUseCases>()));
  gh.factory<_i109.MyCourseStore>(
      () => _i109.MyCourseStore(get<_i93.MyCourseUseCase>()));
  return get;
}
