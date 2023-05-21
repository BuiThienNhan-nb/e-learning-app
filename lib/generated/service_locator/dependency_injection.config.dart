// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../bases/presentation/atoms/bottom_nav_bar.dart' as _i8;
import '../../configs/routes.dart' as _i4;
import '../../core/app/provider.dart' as _i3;
import '../../core/platform/network_status.dart' as _i37;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i18;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i21;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i82;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i88;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i81;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i87;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i83;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i89;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i120;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i19;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i22;
import '../../features/auth/sign_in/data/local/datasources/auth_local_data_source.dart'
    as _i5;
import '../../features/auth/sign_in/data/remote/datasources/auth_remote_data_source.dart'
    as _i7;
import '../../features/auth/sign_in/data/remote/repositories/auth_repository_imp.dart'
    as _i63;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i62;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i64;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i108;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i6;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i109;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i57;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i60;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i59;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i61;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i113;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i58;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i10;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i11;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i66;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i69;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i65;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i68;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i67;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i70;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i114;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i115;
import '../../features/create_exam/data/datasources/create_exam_data_source.dart'
    as _i13;
import '../../features/create_exam/data/repositories/create_exam_repository_imp.dart'
    as _i72;
import '../../features/create_exam/domain/repositories/create_exam_repository.dart'
    as _i71;
import '../../features/create_exam/domain/usecases/create_exam_use_case.dart'
    as _i73;
import '../../features/create_exam/presentation/states/create_exam_provider.dart'
    as _i14;
import '../../features/create_exam/presentation/states/create_exam_store.dart'
    as _i117;
import '../../features/do_exam/data/datasources/do_exam_data_source.dart'
    as _i15;
import '../../features/do_exam/data/repositories/do_exam_repository_imp.dart'
    as _i75;
import '../../features/do_exam/domain/repositories/do_exam_repository.dart'
    as _i74;
import '../../features/do_exam/domain/usecases/do_exam_use_case.dart' as _i76;
import '../../features/do_exam/presentation/state/do_exam_provider.dart'
    as _i16;
import '../../features/do_exam/presentation/state/do_exam_store.dart' as _i118;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i17;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i79;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i78;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i80;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i119;
import '../../features/get_all_courses/data/datasources/get_all_courses_data_source.dart'
    as _i20;
import '../../features/get_all_courses/data/repositories/get_all_courses_repository_imp.dart'
    as _i85;
import '../../features/get_all_courses/domain/repositories/get_all_courses_repository.dart'
    as _i84;
import '../../features/get_all_courses/domain/usecases/get_all_courses_use_case.dart'
    as _i86;
import '../../features/get_all_courses/presentation/state/get_all_courses_store.dart'
    as _i121;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i24;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i25;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i94;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i97;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i93;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i96;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i95;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i98;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i122;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i123;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i23;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i91;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i90;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i43;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i92;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i100;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i99;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i26;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i27;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i102;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i101;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i103;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i124;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i28;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i36;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i105;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i104;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i106;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i116;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i125;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i112;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i12;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i52;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i38;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i48;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i53;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i40;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i50;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i55;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i39;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i49;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i54;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i41;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i56;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i51;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i77;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i107;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i111;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i42;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i9;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i44;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i46;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i45;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i47;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i110;
import '../../utils/mock/mock_course_reviews.dart' as _i29;
import '../../utils/mock/mock_courses.dart' as _i30;
import '../../utils/mock/mock_faq.dart' as _i32;
import '../../utils/mock/mock_teacher_reviews.dart' as _i33;
import '../../utils/mock/mock_teachers.dart' as _i34;
import '../../utils/mock/mock_transactions.dart' as _i35;
import '../../utils/mock/mocl_exam.dart'
    as _i31; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.AuthLocalDataSource>(() => _i5.AuthLocalDataSourceImp());
  gh.factory<_i6.AuthPageProvider>(() => _i6.AuthPageProvider());
  gh.lazySingleton<_i7.AuthRemoteDataSource>(
      () => _i7.AuthRemoteDataSourceImp());
  gh.lazySingleton<_i8.BottomNavigationBarConfig>(
      () => _i8.BottomNavigationBarConfig());
  gh.factory<_i9.ChatProvider>(() => _i9.ChatProvider());
  gh.lazySingleton<_i10.CourseDetailDataSource>(
      () => _i10.CourseDetailDataSourceImp());
  gh.lazySingleton<_i11.CourseRateDataSource>(
      () => _i11.CourseRateDataSourceImp());
  gh.factory<_i12.CreateCourseProvider>(() => _i12.CreateCourseProvider());
  gh.lazySingleton<_i13.CreateExamDataSource>(
      () => _i13.CreateExamDataSourceImp());
  gh.factory<_i14.CreateExamProvider>(() => _i14.CreateExamProvider());
  gh.lazySingleton<_i15.DoExamDataSource>(() => _i15.DoExamDataSourceImp());
  gh.factory<_i16.DoExamProvider>(() => _i16.DoExamProvider());
  gh.lazySingleton<_i17.EnrolledCourseDataSource>(
      () => _i17.EnrolledCourseDataSourceImp());
  gh.lazySingleton<_i18.ForgotPasswordDataSource>(
      () => _i18.ForgotPasswordDataSourceImp());
  gh.factory<_i19.ForgotPasswordPageProvider>(
      () => _i19.ForgotPasswordPageProvider());
  gh.lazySingleton<_i20.GetAllCoursesDataSource>(
      () => _i20.GetAllCoursesDataSourceImp());
  gh.lazySingleton<_i21.GetForgotPasswordCodeDataSource>(
      () => _i21.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i22.GetForgotPasswordCodeProvider>(
      () => _i22.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i23.GetLessonCommentsDataSource>(
      () => _i23.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i24.GetRecommendedCoursesDataSource>(
      () => _i24.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i25.GetTopTeachersDataSource>(
      () => _i25.GetTopTeachersDataSourceImp());
  gh.factory<_i26.LessonDetailPageProvider>(
      () => _i26.LessonDetailPageProvider());
  gh.lazySingleton<_i27.LiveStreamDataSource>(
      () => _i27.LiveStreamDataSourceImp());
  gh.factory<_i28.MainPageStore>(() => _i28.MainPageStore());
  gh.lazySingleton<_i29.MockCourseReviews>(() => _i29.MockCourseReviews());
  gh.lazySingleton<_i30.MockCourses>(() => _i30.MockCourses());
  gh.factory<_i31.MockExam>(() => _i31.MockExam());
  gh.lazySingleton<_i32.MockFAQ>(() => _i32.MockFAQ());
  gh.lazySingleton<_i33.MockTeacherReviews>(() => _i33.MockTeacherReviews());
  gh.lazySingleton<_i34.MockTeachers>(() => _i34.MockTeachers());
  gh.lazySingleton<_i35.MockTransactions>(() => _i35.MockTransactions());
  gh.lazySingleton<_i36.MyCourseDataSource>(() => _i36.MyCourseDataSourceImp());
  gh.factory<_i37.NetworkStatus>(() => _i37.NetworkStatusImp());
  gh.lazySingleton<_i38.PaymentDataSource>(() => _i38.PaymentDataSourceImp());
  gh.lazySingleton<_i39.PaymentRepository>(() => _i40.PaymentRepositoryImp(
        get<_i38.PaymentDataSource>(),
        get<_i37.NetworkStatus>(),
      ));
  gh.lazySingleton<_i41.PaymentUseCases>(
      () => _i41.PaymentUseCases(get<_i39.PaymentRepository>()));
  gh.factory<_i42.SettingsPageProvider>(() => _i42.SettingsPageProvider());
  gh.factory<_i43.SocketServices>(() => _i43.SocketServices());
  gh.lazySingleton<_i44.TeacherDetailDataSource>(
      () => _i44.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i45.TeacherDetailRepository>(
      () => _i46.TeacherDetailRepositoryImp(
            get<_i37.NetworkStatus>(),
            get<_i44.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i47.TeacherDetailUseCase>(
      () => _i47.TeacherDetailUseCase(get<_i45.TeacherDetailRepository>()));
  gh.lazySingleton<_i48.UpdateAvatarDataSource>(
      () => _i48.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i49.UpdateAvatarRepository>(
      () => _i50.UpdateAvatarRepositoryImp(
            get<_i48.UpdateAvatarDataSource>(),
            get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i51.UpdateAvatarUseCase>(
      () => _i51.UpdateAvatarUseCase(get<_i49.UpdateAvatarRepository>()));
  gh.factory<_i52.UpdateCourseProvider>(() => _i52.UpdateCourseProvider());
  gh.lazySingleton<_i53.UpdateProfileDataSource>(
      () => _i53.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i54.UpdateProfileRepository>(
      () => _i55.UpdateProfileRepositoryImp(
            get<_i53.UpdateProfileDataSource>(),
            get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i56.UpdateProfileUseCase>(
      () => _i56.UpdateProfileUseCase(get<_i54.UpdateProfileRepository>()));
  gh.lazySingleton<_i57.VerifyEmailDataSource>(
      () => _i57.VerifyEmailDataSourceImp());
  gh.factory<_i58.VerifyEmailProvider>(() => _i58.VerifyEmailProvider());
  gh.lazySingleton<_i59.VerifyEmailRepository>(
      () => _i60.VerifyEmailRepositoryImp(
            get<_i57.VerifyEmailDataSource>(),
            get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i61.VerifyEmailUseCase>(
      () => _i61.VerifyEmailUseCase(get<_i59.VerifyEmailRepository>()));
  gh.lazySingleton<_i62.AuthRepository>(() => _i63.AuthRepositoryImp(
        dataSource: get<_i7.AuthRemoteDataSource>(),
        networkStatus: get<_i37.NetworkStatus>(),
      ));
  gh.lazySingleton<_i64.AuthUseCase>(
      () => _i64.AuthUseCase(get<_i62.AuthRepository>()));
  gh.lazySingleton<_i65.CourseDetailRepository>(
      () => _i66.CourseDetailRepositoryImp(
            dataSource: get<_i10.CourseDetailDataSource>(),
            networkStatus: get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i67.CourseDetailUseCases>(
      () => _i67.CourseDetailUseCases(get<_i65.CourseDetailRepository>()));
  gh.lazySingleton<_i68.CourseRateRepository>(
      () => _i69.CourseRateRepositoryImp(
            dataSource: get<_i11.CourseRateDataSource>(),
            networkStatus: get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i70.CourseRateUseCases>(
      () => _i70.CourseRateUseCases(get<_i68.CourseRateRepository>()));
  gh.lazySingleton<_i71.CreateExamRepository>(
      () => _i72.CreateExamRepositoryImp(
            get<_i37.NetworkStatus>(),
            get<_i13.CreateExamDataSource>(),
          ));
  gh.lazySingleton<_i73.CreateExamUseCase>(
      () => _i73.CreateExamUseCase(get<_i71.CreateExamRepository>()));
  gh.lazySingleton<_i74.DoExamRepository>(() => _i75.DoExamRepositoryImp(
        get<_i37.NetworkStatus>(),
        get<_i15.DoExamDataSource>(),
      ));
  gh.lazySingleton<_i76.DoExamUseCase>(
      () => _i76.DoExamUseCase(get<_i74.DoExamRepository>()));
  gh.factory<_i77.EditProfileStore>(
      () => _i77.EditProfileStore(get<_i56.UpdateProfileUseCase>()));
  gh.lazySingleton<_i78.EnrolledCourseRepository>(
      () => _i79.EnrolledCourseRepositoryImp(
            get<_i37.NetworkStatus>(),
            get<_i17.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i80.EnrolledCourseUseCase>(
      () => _i80.EnrolledCourseUseCase(get<_i78.EnrolledCourseRepository>()));
  gh.lazySingleton<_i81.ForgotPasswordRepository>(
      () => _i82.ForgotPasswordRepositoryImp(
            get<_i18.ForgotPasswordDataSource>(),
            get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i83.ForgotPasswordUseCase>(
      () => _i83.ForgotPasswordUseCase(get<_i81.ForgotPasswordRepository>()));
  gh.lazySingleton<_i84.GetAllCoursesRepository>(
      () => _i85.GetAllCoursesRepositoryImp(
            get<_i37.NetworkStatus>(),
            get<_i20.GetAllCoursesDataSource>(),
          ));
  gh.lazySingleton<_i86.GetAllCoursesUseCase>(
      () => _i86.GetAllCoursesUseCase(get<_i84.GetAllCoursesRepository>()));
  gh.lazySingleton<_i87.GetForgotPasswordCodeRepository>(
      () => _i88.GetForgotPasswordCodeRepositoryImp(
            get<_i21.GetForgotPasswordCodeDataSource>(),
            get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i89.GetForgotPasswordCodeUseCase>(() =>
      _i89.GetForgotPasswordCodeUseCase(
          get<_i87.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i90.GetLessonCommentsRepository>(
      () => _i91.GetLessonCommentsRepositoryImp(
            dataSource: get<_i23.GetLessonCommentsDataSource>(),
            networkStatus: get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i92.GetLessonCommentsUseCase>(() =>
      _i92.GetLessonCommentsUseCase(get<_i90.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i93.GetRecommendedCoursesRepository>(
      () => _i94.GetRecommendedCoursesRepositoryImp(
            get<_i24.GetRecommendedCoursesDataSource>(),
            get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i95.GetRecommendedCoursesUseCase>(() =>
      _i95.GetRecommendedCoursesUseCase(
          get<_i93.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i96.GetTopTeachersRepository>(
      () => _i97.GetTopTeachersRepositoryImp(
            get<_i25.GetTopTeachersDataSource>(),
            get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i98.GetTopTeachersUseCase>(
      () => _i98.GetTopTeachersUseCase(get<_i96.GetTopTeachersRepository>()));
  gh.factory<_i99.LessonCommentsStore>(
      () => _i99.LessonCommentsStore(get<_i92.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i100.LessonDetailUseCase>(
      () => _i100.LessonDetailUseCase(get<_i90.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i101.LiveStreamRepository>(
      () => _i102.LiveStreamRepositoryImp(
            dataSource: get<_i27.LiveStreamDataSource>(),
            networkStatus: get<_i37.NetworkStatus>(),
          ));
  gh.lazySingleton<_i103.LiveStreamUseCases>(
      () => _i103.LiveStreamUseCases(get<_i101.LiveStreamRepository>()));
  gh.lazySingleton<_i104.MyCourseRepository>(() => _i105.MyCourseRepositoryImp(
        get<_i36.MyCourseDataSource>(),
        get<_i37.NetworkStatus>(),
      ));
  gh.lazySingleton<_i106.MyCourseUseCase>(() => _i106.MyCourseUseCase(
        get<_i104.MyCourseRepository>(),
        get<_i65.CourseDetailRepository>(),
      ));
  gh.factory<_i107.PaymentStore>(
      () => _i107.PaymentStore(get<_i41.PaymentUseCases>()));
  gh.factory<_i108.SignInStore>(
      () => _i108.SignInStore(get<_i64.AuthUseCase>()));
  gh.factory<_i109.SignUpStore>(
      () => _i109.SignUpStore(get<_i64.AuthUseCase>()));
  gh.factory<_i110.TeacherDetailStore>(
      () => _i110.TeacherDetailStore(get<_i47.TeacherDetailUseCase>()));
  gh.factory<_i111.UpdateAvatarStore>(
      () => _i111.UpdateAvatarStore(get<_i51.UpdateAvatarUseCase>()));
  gh.factory<_i112.UpdateCourseStore>(
      () => _i112.UpdateCourseStore(get<_i106.MyCourseUseCase>()));
  gh.factory<_i113.VerifyEmailStore>(
      () => _i113.VerifyEmailStore(get<_i61.VerifyEmailUseCase>()));
  gh.factory<_i114.CourseDetailStore>(
      () => _i114.CourseDetailStore(get<_i67.CourseDetailUseCases>()));
  gh.factory<_i115.CourseRateStore>(
      () => _i115.CourseRateStore(get<_i70.CourseRateUseCases>()));
  gh.factory<_i116.CreateCourseStore>(
      () => _i116.CreateCourseStore(get<_i106.MyCourseUseCase>()));
  gh.factory<_i117.CreateExamStore>(
      () => _i117.CreateExamStore(get<_i73.CreateExamUseCase>()));
  gh.factory<_i118.DoExamStore>(
      () => _i118.DoExamStore(get<_i76.DoExamUseCase>()));
  gh.factory<_i119.EnrolledCourseStore>(
      () => _i119.EnrolledCourseStore(get<_i80.EnrolledCourseUseCase>()));
  gh.factory<_i120.ForgotPasswordStore>(() => _i120.ForgotPasswordStore(
        get<_i83.ForgotPasswordUseCase>(),
        get<_i89.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i121.GetAllCoursesStore>(
      () => _i121.GetAllCoursesStore(get<_i86.GetAllCoursesUseCase>()));
  gh.factory<_i122.GetRecommendedCoursesStore>(() =>
      _i122.GetRecommendedCoursesStore(
          get<_i95.GetRecommendedCoursesUseCase>()));
  gh.factory<_i123.GetTopTeachersStore>(
      () => _i123.GetTopTeachersStore(get<_i98.GetTopTeachersUseCase>()));
  gh.factory<_i124.LiveStreamStore>(
      () => _i124.LiveStreamStore(get<_i103.LiveStreamUseCases>()));
  gh.factory<_i125.MyCourseStore>(
      () => _i125.MyCourseStore(get<_i106.MyCourseUseCase>()));
  return get;
}
