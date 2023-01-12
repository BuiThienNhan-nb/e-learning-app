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
import '../../core/platform/network_status.dart' as _i35;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i17;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i19;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i80;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i83;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i79;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i82;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i81;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i84;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i115;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i18;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i20;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i61;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i60;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i62;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i103;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i104;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i55;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i58;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i57;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i59;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i108;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i56;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i9;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i10;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i64;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i67;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i63;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i66;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i65;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i68;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i109;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i110;
import '../../features/create_exam/data/datasources/create_exam_data_source.dart'
    as _i12;
import '../../features/create_exam/data/repositories/create_exam_repository_imp.dart'
    as _i70;
import '../../features/create_exam/domain/repositories/create_exam_repository.dart'
    as _i69;
import '../../features/create_exam/domain/usecases/create_exam_use_case.dart'
    as _i71;
import '../../features/create_exam/presentation/states/create_exam_provider.dart'
    as _i13;
import '../../features/create_exam/presentation/states/create_exam_store.dart'
    as _i112;
import '../../features/do_exam/data/datasources/do_exam_data_source.dart'
    as _i14;
import '../../features/do_exam/data/repositories/do_exam_repository_imp.dart'
    as _i73;
import '../../features/do_exam/domain/repositories/do_exam_repository.dart'
    as _i72;
import '../../features/do_exam/domain/usecases/do_exam_use_case.dart' as _i74;
import '../../features/do_exam/presentation/state/do_exam_provider.dart'
    as _i15;
import '../../features/do_exam/presentation/state/do_exam_store.dart' as _i113;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i16;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i77;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i76;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i78;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i114;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i22;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i23;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i89;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i92;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i88;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i91;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i90;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i93;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i116;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i117;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i21;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i86;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i85;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i41;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i87;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i95;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i94;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i24;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i25;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i97;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i96;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i98;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i118;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i26;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i34;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i100;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i99;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i101;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i111;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i119;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i107;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i11;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i50;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i36;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i46;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i51;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i38;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i48;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i53;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i37;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i47;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i52;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i39;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i54;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i49;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i75;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i102;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i106;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i40;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i8;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i42;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i44;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i43;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i45;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i105;
import '../../utils/mock/mock_course_reviews.dart' as _i27;
import '../../utils/mock/mock_courses.dart' as _i28;
import '../../utils/mock/mock_faq.dart' as _i30;
import '../../utils/mock/mock_teacher_reviews.dart' as _i31;
import '../../utils/mock/mock_teachers.dart' as _i32;
import '../../utils/mock/mock_transactions.dart' as _i33;
import '../../utils/mock/mocl_exam.dart'
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
  gh.lazySingleton<_i12.CreateExamDataSource>(
      () => _i12.CreateExamDataSourceImp());
  gh.factory<_i13.CreateExamProvider>(() => _i13.CreateExamProvider());
  gh.lazySingleton<_i14.DoExamDataSource>(() => _i14.DoExamDataSourceImp());
  gh.factory<_i15.DoExamProvider>(() => _i15.DoExamProvider());
  gh.lazySingleton<_i16.EnrolledCourseDataSource>(
      () => _i16.EnrolledCourseDataSourceImp());
  gh.lazySingleton<_i17.ForgotPasswordDataSource>(
      () => _i17.ForgotPasswordDataSourceImp());
  gh.factory<_i18.ForgotPasswordPageProvider>(
      () => _i18.ForgotPasswordPageProvider());
  gh.lazySingleton<_i19.GetForgotPasswordCodeDataSource>(
      () => _i19.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i20.GetForgotPasswordCodeProvider>(
      () => _i20.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i21.GetLessonCommentsDataSource>(
      () => _i21.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i22.GetRecommendedCoursesDataSource>(
      () => _i22.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i23.GetTopTeachersDataSource>(
      () => _i23.GetTopTeachersDataSourceImp());
  gh.factory<_i24.LessonDetailPageProvider>(
      () => _i24.LessonDetailPageProvider());
  gh.lazySingleton<_i25.LiveStreamDataSource>(
      () => _i25.LiveStreamDataSourceImp());
  gh.factory<_i26.MainPageStore>(() => _i26.MainPageStore());
  gh.lazySingleton<_i27.MockCourseReviews>(() => _i27.MockCourseReviews());
  gh.lazySingleton<_i28.MockCourses>(() => _i28.MockCourses());
  gh.factory<_i29.MockExam>(() => _i29.MockExam());
  gh.lazySingleton<_i30.MockFAQ>(() => _i30.MockFAQ());
  gh.lazySingleton<_i31.MockTeacherReviews>(() => _i31.MockTeacherReviews());
  gh.lazySingleton<_i32.MockTeachers>(() => _i32.MockTeachers());
  gh.lazySingleton<_i33.MockTransactions>(() => _i33.MockTransactions());
  gh.lazySingleton<_i34.MyCourseDataSource>(() => _i34.MyCourseDataSourceImp());
  gh.factory<_i35.NetworkStatus>(() => _i35.NetworkStatusImp());
  gh.lazySingleton<_i36.PaymentDataSource>(() => _i36.PaymentDataSourceImp());
  gh.lazySingleton<_i37.PaymentRepository>(() => _i38.PaymentRepositoryImp(
        get<_i36.PaymentDataSource>(),
        get<_i35.NetworkStatus>(),
      ));
  gh.lazySingleton<_i39.PaymentUseCases>(
      () => _i39.PaymentUseCases(get<_i37.PaymentRepository>()));
  gh.factory<_i40.SettingsPageProvider>(() => _i40.SettingsPageProvider());
  gh.factory<_i41.SocketServices>(() => _i41.SocketServices());
  gh.lazySingleton<_i42.TeacherDetailDataSource>(
      () => _i42.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i43.TeacherDetailRepository>(
      () => _i44.TeacherDetailRepositoryImp(
            get<_i35.NetworkStatus>(),
            get<_i42.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i45.TeacherDetailUseCase>(
      () => _i45.TeacherDetailUseCase(get<_i43.TeacherDetailRepository>()));
  gh.lazySingleton<_i46.UpdateAvatarDataSource>(
      () => _i46.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i47.UpdateAvatarRepository>(
      () => _i48.UpdateAvatarRepositoryImp(
            get<_i46.UpdateAvatarDataSource>(),
            get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i49.UpdateAvatarUseCase>(
      () => _i49.UpdateAvatarUseCase(get<_i47.UpdateAvatarRepository>()));
  gh.factory<_i50.UpdateCourseProvider>(() => _i50.UpdateCourseProvider());
  gh.lazySingleton<_i51.UpdateProfileDataSource>(
      () => _i51.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i52.UpdateProfileRepository>(
      () => _i53.UpdateProfileRepositoryImp(
            get<_i51.UpdateProfileDataSource>(),
            get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i54.UpdateProfileUseCase>(
      () => _i54.UpdateProfileUseCase(get<_i52.UpdateProfileRepository>()));
  gh.lazySingleton<_i55.VerifyEmailDataSource>(
      () => _i55.VerifyEmailDataSourceImp());
  gh.factory<_i56.VerifyEmailProvider>(() => _i56.VerifyEmailProvider());
  gh.lazySingleton<_i57.VerifyEmailRepository>(
      () => _i58.VerifyEmailRepositoryImp(
            get<_i55.VerifyEmailDataSource>(),
            get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i59.VerifyEmailUseCase>(
      () => _i59.VerifyEmailUseCase(get<_i57.VerifyEmailRepository>()));
  gh.lazySingleton<_i60.AuthRepository>(() => _i61.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i35.NetworkStatus>(),
      ));
  gh.lazySingleton<_i62.AuthUseCase>(
      () => _i62.AuthUseCase(get<_i60.AuthRepository>()));
  gh.lazySingleton<_i63.CourseDetailRepository>(
      () => _i64.CourseDetailRepositoryImp(
            dataSource: get<_i9.CourseDetailDataSource>(),
            networkStatus: get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i65.CourseDetailUseCases>(
      () => _i65.CourseDetailUseCases(get<_i63.CourseDetailRepository>()));
  gh.lazySingleton<_i66.CourseRateRepository>(
      () => _i67.CourseRateRepositoryImp(
            dataSource: get<_i10.CourseRateDataSource>(),
            networkStatus: get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i68.CourseRateUseCases>(
      () => _i68.CourseRateUseCases(get<_i66.CourseRateRepository>()));
  gh.lazySingleton<_i69.CreateExamRepository>(
      () => _i70.CreateExamRepositoryImp(
            get<_i35.NetworkStatus>(),
            get<_i12.CreateExamDataSource>(),
          ));
  gh.lazySingleton<_i71.CreateExamUseCase>(
      () => _i71.CreateExamUseCase(get<_i69.CreateExamRepository>()));
  gh.lazySingleton<_i72.DoExamRepository>(() => _i73.DoExamRepositoryImp(
        get<_i35.NetworkStatus>(),
        get<_i14.DoExamDataSource>(),
      ));
  gh.lazySingleton<_i74.DoExamUseCase>(
      () => _i74.DoExamUseCase(get<_i72.DoExamRepository>()));
  gh.factory<_i75.EditProfileStore>(
      () => _i75.EditProfileStore(get<_i54.UpdateProfileUseCase>()));
  gh.lazySingleton<_i76.EnrolledCourseRepository>(
      () => _i77.EnrolledCourseRepositoryImp(
            get<_i35.NetworkStatus>(),
            get<_i16.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i78.EnrolledCourseUseCase>(
      () => _i78.EnrolledCourseUseCase(get<_i76.EnrolledCourseRepository>()));
  gh.lazySingleton<_i79.ForgotPasswordRepository>(
      () => _i80.ForgotPasswordRepositoryImp(
            get<_i17.ForgotPasswordDataSource>(),
            get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i81.ForgotPasswordUseCase>(
      () => _i81.ForgotPasswordUseCase(get<_i79.ForgotPasswordRepository>()));
  gh.lazySingleton<_i82.GetForgotPasswordCodeRepository>(
      () => _i83.GetForgotPasswordCodeRepositoryImp(
            get<_i19.GetForgotPasswordCodeDataSource>(),
            get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i84.GetForgotPasswordCodeUseCase>(() =>
      _i84.GetForgotPasswordCodeUseCase(
          get<_i82.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i85.GetLessonCommentsRepository>(
      () => _i86.GetLessonCommentsRepositoryImp(
            dataSource: get<_i21.GetLessonCommentsDataSource>(),
            networkStatus: get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i87.GetLessonCommentsUseCase>(() =>
      _i87.GetLessonCommentsUseCase(get<_i85.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i88.GetRecommendedCoursesRepository>(
      () => _i89.GetRecommendedCoursesRepositoryImp(
            get<_i22.GetRecommendedCoursesDataSource>(),
            get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i90.GetRecommendedCoursesUseCase>(() =>
      _i90.GetRecommendedCoursesUseCase(
          get<_i88.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i91.GetTopTeachersRepository>(
      () => _i92.GetTopTeachersRepositoryImp(
            get<_i23.GetTopTeachersDataSource>(),
            get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i93.GetTopTeachersUseCase>(
      () => _i93.GetTopTeachersUseCase(get<_i91.GetTopTeachersRepository>()));
  gh.factory<_i94.LessonCommentsStore>(
      () => _i94.LessonCommentsStore(get<_i87.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i95.LessonDetailUseCase>(
      () => _i95.LessonDetailUseCase(get<_i85.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i96.LiveStreamRepository>(
      () => _i97.LiveStreamRepositoryImp(
            dataSource: get<_i25.LiveStreamDataSource>(),
            networkStatus: get<_i35.NetworkStatus>(),
          ));
  gh.lazySingleton<_i98.LiveStreamUseCases>(
      () => _i98.LiveStreamUseCases(get<_i96.LiveStreamRepository>()));
  gh.lazySingleton<_i99.MyCourseRepository>(() => _i100.MyCourseRepositoryImp(
        get<_i34.MyCourseDataSource>(),
        get<_i35.NetworkStatus>(),
      ));
  gh.lazySingleton<_i101.MyCourseUseCase>(() => _i101.MyCourseUseCase(
        get<_i99.MyCourseRepository>(),
        get<_i63.CourseDetailRepository>(),
      ));
  gh.factory<_i102.PaymentStore>(
      () => _i102.PaymentStore(get<_i39.PaymentUseCases>()));
  gh.factory<_i103.SignInStore>(
      () => _i103.SignInStore(get<_i62.AuthUseCase>()));
  gh.factory<_i104.SignUpStore>(
      () => _i104.SignUpStore(get<_i62.AuthUseCase>()));
  gh.factory<_i105.TeacherDetailStore>(
      () => _i105.TeacherDetailStore(get<_i45.TeacherDetailUseCase>()));
  gh.factory<_i106.UpdateAvatarStore>(
      () => _i106.UpdateAvatarStore(get<_i49.UpdateAvatarUseCase>()));
  gh.factory<_i107.UpdateCourseStore>(
      () => _i107.UpdateCourseStore(get<_i101.MyCourseUseCase>()));
  gh.factory<_i108.VerifyEmailStore>(
      () => _i108.VerifyEmailStore(get<_i59.VerifyEmailUseCase>()));
  gh.factory<_i109.CourseDetailStore>(
      () => _i109.CourseDetailStore(get<_i65.CourseDetailUseCases>()));
  gh.factory<_i110.CourseRateStore>(
      () => _i110.CourseRateStore(get<_i68.CourseRateUseCases>()));
  gh.factory<_i111.CreateCourseStore>(
      () => _i111.CreateCourseStore(get<_i101.MyCourseUseCase>()));
  gh.factory<_i112.CreateExamStore>(
      () => _i112.CreateExamStore(get<_i71.CreateExamUseCase>()));
  gh.factory<_i113.DoExamStore>(
      () => _i113.DoExamStore(get<_i74.DoExamUseCase>()));
  gh.factory<_i114.EnrolledCourseStore>(
      () => _i114.EnrolledCourseStore(get<_i78.EnrolledCourseUseCase>()));
  gh.factory<_i115.ForgotPasswordStore>(() => _i115.ForgotPasswordStore(
        get<_i81.ForgotPasswordUseCase>(),
        get<_i84.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i116.GetRecommendedCoursesStore>(() =>
      _i116.GetRecommendedCoursesStore(
          get<_i90.GetRecommendedCoursesUseCase>()));
  gh.factory<_i117.GetTopTeachersStore>(
      () => _i117.GetTopTeachersStore(get<_i93.GetTopTeachersUseCase>()));
  gh.factory<_i118.LiveStreamStore>(
      () => _i118.LiveStreamStore(get<_i98.LiveStreamUseCases>()));
  gh.factory<_i119.MyCourseStore>(
      () => _i119.MyCourseStore(get<_i101.MyCourseUseCase>()));
  return get;
}
