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
import '../../core/platform/network_status.dart' as _i39;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i20;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i23;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i86;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i92;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i85;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i91;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i87;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i93;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i124;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i21;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i24;
import '../../features/auth/sign_in/data/local/datasources/auth_local_data_source.dart'
    as _i5;
import '../../features/auth/sign_in/data/remote/datasources/auth_remote_data_source.dart'
    as _i7;
import '../../features/auth/sign_in/data/remote/repositories/auth_repository_imp.dart'
    as _i67;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i66;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i68;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i112;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i6;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i113;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i61;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i64;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i63;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i65;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i117;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i62;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i10;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i11;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i70;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i73;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i69;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i72;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i71;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i74;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i118;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i119;
import '../../features/create_exam/data/datasources/create_exam_data_source.dart'
    as _i13;
import '../../features/create_exam/data/repositories/create_exam_repository_imp.dart'
    as _i76;
import '../../features/create_exam/domain/repositories/create_exam_repository.dart'
    as _i75;
import '../../features/create_exam/domain/usecases/create_exam_use_case.dart'
    as _i77;
import '../../features/create_exam/presentation/states/create_exam_provider.dart'
    as _i14;
import '../../features/create_exam/presentation/states/create_exam_store.dart'
    as _i121;
import '../../features/do_exam/data/datasources/do_exam_data_source.dart'
    as _i15;
import '../../features/do_exam/data/repositories/do_exam_repository_imp.dart'
    as _i79;
import '../../features/do_exam/domain/repositories/do_exam_repository.dart'
    as _i78;
import '../../features/do_exam/domain/usecases/do_exam_use_case.dart' as _i80;
import '../../features/do_exam/presentation/state/do_exam_provider.dart'
    as _i16;
import '../../features/do_exam/presentation/state/do_exam_store.dart' as _i122;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i17;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i83;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i82;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i84;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i123;
import '../../features/get_all_courses/data/datasources/get_all_courses_data_source.dart'
    as _i22;
import '../../features/get_all_courses/data/repositories/get_all_courses_repository_imp.dart'
    as _i89;
import '../../features/get_all_courses/domain/repositories/get_all_courses_repository.dart'
    as _i88;
import '../../features/get_all_courses/domain/usecases/get_all_courses_use_case.dart'
    as _i90;
import '../../features/get_all_courses/presentation/state/get_all_courses_store.dart'
    as _i125;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i26;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i27;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i98;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i101;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i97;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i100;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i99;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i102;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i126;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i127;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i25;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i95;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i94;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i47;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i96;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i104;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i103;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i28;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i29;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i106;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i105;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i107;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i128;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i30;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i38;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i109;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i108;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i110;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i120;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i129;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i116;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i12;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i56;
import '../../features/search/data/local/local_fetch_search_history.dart'
    as _i19;
import '../../features/search/data/local/local_save_search_history.dart'
    as _i45;
import '../../features/search/domain/repositories/fetch_search_history.dart'
    as _i18;
import '../../features/search/domain/repositories/save_search_history.dart'
    as _i44;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i40;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i52;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i57;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i42;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i54;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i59;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i41;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i53;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i58;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i43;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i60;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i55;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i81;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i111;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i115;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i46;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i9;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i48;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i50;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i49;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i51;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i114;
import '../../utils/mock/mock_course_reviews.dart' as _i31;
import '../../utils/mock/mock_courses.dart' as _i32;
import '../../utils/mock/mock_faq.dart' as _i34;
import '../../utils/mock/mock_teacher_reviews.dart' as _i35;
import '../../utils/mock/mock_teachers.dart' as _i36;
import '../../utils/mock/mock_transactions.dart' as _i37;
import '../../utils/mock/mocl_exam.dart'
    as _i33; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i18.FetchSearchHistory>(
      () => _i19.LocalFetchSearchHistory());
  gh.lazySingleton<_i20.ForgotPasswordDataSource>(
      () => _i20.ForgotPasswordDataSourceImp());
  gh.factory<_i21.ForgotPasswordPageProvider>(
      () => _i21.ForgotPasswordPageProvider());
  gh.lazySingleton<_i22.GetAllCoursesDataSource>(
      () => _i22.GetAllCoursesDataSourceImp());
  gh.lazySingleton<_i23.GetForgotPasswordCodeDataSource>(
      () => _i23.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i24.GetForgotPasswordCodeProvider>(
      () => _i24.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i25.GetLessonCommentsDataSource>(
      () => _i25.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i26.GetRecommendedCoursesDataSource>(
      () => _i26.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i27.GetTopTeachersDataSource>(
      () => _i27.GetTopTeachersDataSourceImp());
  gh.factory<_i28.LessonDetailPageProvider>(
      () => _i28.LessonDetailPageProvider());
  gh.lazySingleton<_i29.LiveStreamDataSource>(
      () => _i29.LiveStreamDataSourceImp());
  gh.factory<_i30.MainPageStore>(() => _i30.MainPageStore());
  gh.lazySingleton<_i31.MockCourseReviews>(() => _i31.MockCourseReviews());
  gh.lazySingleton<_i32.MockCourses>(() => _i32.MockCourses());
  gh.factory<_i33.MockExam>(() => _i33.MockExam());
  gh.lazySingleton<_i34.MockFAQ>(() => _i34.MockFAQ());
  gh.lazySingleton<_i35.MockTeacherReviews>(() => _i35.MockTeacherReviews());
  gh.lazySingleton<_i36.MockTeachers>(() => _i36.MockTeachers());
  gh.lazySingleton<_i37.MockTransactions>(() => _i37.MockTransactions());
  gh.lazySingleton<_i38.MyCourseDataSource>(() => _i38.MyCourseDataSourceImp());
  gh.factory<_i39.NetworkStatus>(() => _i39.NetworkStatusImp());
  gh.lazySingleton<_i40.PaymentDataSource>(() => _i40.PaymentDataSourceImp());
  gh.lazySingleton<_i41.PaymentRepository>(() => _i42.PaymentRepositoryImp(
        get<_i40.PaymentDataSource>(),
        get<_i39.NetworkStatus>(),
      ));
  gh.lazySingleton<_i43.PaymentUseCases>(
      () => _i43.PaymentUseCases(get<_i41.PaymentRepository>()));
  gh.lazySingleton<_i44.SaveSearchHistory>(() => _i45.LocalSaveSearchHistory());
  gh.factory<_i46.SettingsPageProvider>(() => _i46.SettingsPageProvider());
  gh.factory<_i47.SocketServices>(() => _i47.SocketServices());
  gh.lazySingleton<_i48.TeacherDetailDataSource>(
      () => _i48.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i49.TeacherDetailRepository>(
      () => _i50.TeacherDetailRepositoryImp(
            get<_i39.NetworkStatus>(),
            get<_i48.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i51.TeacherDetailUseCase>(
      () => _i51.TeacherDetailUseCase(get<_i49.TeacherDetailRepository>()));
  gh.lazySingleton<_i52.UpdateAvatarDataSource>(
      () => _i52.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i53.UpdateAvatarRepository>(
      () => _i54.UpdateAvatarRepositoryImp(
            get<_i52.UpdateAvatarDataSource>(),
            get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i55.UpdateAvatarUseCase>(
      () => _i55.UpdateAvatarUseCase(get<_i53.UpdateAvatarRepository>()));
  gh.factory<_i56.UpdateCourseProvider>(() => _i56.UpdateCourseProvider());
  gh.lazySingleton<_i57.UpdateProfileDataSource>(
      () => _i57.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i58.UpdateProfileRepository>(
      () => _i59.UpdateProfileRepositoryImp(
            get<_i57.UpdateProfileDataSource>(),
            get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i60.UpdateProfileUseCase>(
      () => _i60.UpdateProfileUseCase(get<_i58.UpdateProfileRepository>()));
  gh.lazySingleton<_i61.VerifyEmailDataSource>(
      () => _i61.VerifyEmailDataSourceImp());
  gh.factory<_i62.VerifyEmailProvider>(() => _i62.VerifyEmailProvider());
  gh.lazySingleton<_i63.VerifyEmailRepository>(
      () => _i64.VerifyEmailRepositoryImp(
            get<_i61.VerifyEmailDataSource>(),
            get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i65.VerifyEmailUseCase>(
      () => _i65.VerifyEmailUseCase(get<_i63.VerifyEmailRepository>()));
  gh.lazySingleton<_i66.AuthRepository>(() => _i67.AuthRepositoryImp(
        dataSource: get<_i7.AuthRemoteDataSource>(),
        networkStatus: get<_i39.NetworkStatus>(),
      ));
  gh.lazySingleton<_i68.AuthUseCase>(
      () => _i68.AuthUseCase(get<_i66.AuthRepository>()));
  gh.lazySingleton<_i69.CourseDetailRepository>(
      () => _i70.CourseDetailRepositoryImp(
            dataSource: get<_i10.CourseDetailDataSource>(),
            networkStatus: get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i71.CourseDetailUseCases>(
      () => _i71.CourseDetailUseCases(get<_i69.CourseDetailRepository>()));
  gh.lazySingleton<_i72.CourseRateRepository>(
      () => _i73.CourseRateRepositoryImp(
            dataSource: get<_i11.CourseRateDataSource>(),
            networkStatus: get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i74.CourseRateUseCases>(
      () => _i74.CourseRateUseCases(get<_i72.CourseRateRepository>()));
  gh.lazySingleton<_i75.CreateExamRepository>(
      () => _i76.CreateExamRepositoryImp(
            get<_i39.NetworkStatus>(),
            get<_i13.CreateExamDataSource>(),
          ));
  gh.lazySingleton<_i77.CreateExamUseCase>(
      () => _i77.CreateExamUseCase(get<_i75.CreateExamRepository>()));
  gh.lazySingleton<_i78.DoExamRepository>(() => _i79.DoExamRepositoryImp(
        get<_i39.NetworkStatus>(),
        get<_i15.DoExamDataSource>(),
      ));
  gh.lazySingleton<_i80.DoExamUseCase>(
      () => _i80.DoExamUseCase(get<_i78.DoExamRepository>()));
  gh.factory<_i81.EditProfileStore>(
      () => _i81.EditProfileStore(get<_i60.UpdateProfileUseCase>()));
  gh.lazySingleton<_i82.EnrolledCourseRepository>(
      () => _i83.EnrolledCourseRepositoryImp(
            get<_i39.NetworkStatus>(),
            get<_i17.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i84.EnrolledCourseUseCase>(
      () => _i84.EnrolledCourseUseCase(get<_i82.EnrolledCourseRepository>()));
  gh.lazySingleton<_i85.ForgotPasswordRepository>(
      () => _i86.ForgotPasswordRepositoryImp(
            get<_i20.ForgotPasswordDataSource>(),
            get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i87.ForgotPasswordUseCase>(
      () => _i87.ForgotPasswordUseCase(get<_i85.ForgotPasswordRepository>()));
  gh.lazySingleton<_i88.GetAllCoursesRepository>(
      () => _i89.GetAllCoursesRepositoryImp(
            get<_i39.NetworkStatus>(),
            get<_i22.GetAllCoursesDataSource>(),
          ));
  gh.lazySingleton<_i90.GetAllCoursesUseCase>(
      () => _i90.GetAllCoursesUseCase(get<_i88.GetAllCoursesRepository>()));
  gh.lazySingleton<_i91.GetForgotPasswordCodeRepository>(
      () => _i92.GetForgotPasswordCodeRepositoryImp(
            get<_i23.GetForgotPasswordCodeDataSource>(),
            get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i93.GetForgotPasswordCodeUseCase>(() =>
      _i93.GetForgotPasswordCodeUseCase(
          get<_i91.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i94.GetLessonCommentsRepository>(
      () => _i95.GetLessonCommentsRepositoryImp(
            dataSource: get<_i25.GetLessonCommentsDataSource>(),
            networkStatus: get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i96.GetLessonCommentsUseCase>(() =>
      _i96.GetLessonCommentsUseCase(get<_i94.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i97.GetRecommendedCoursesRepository>(
      () => _i98.GetRecommendedCoursesRepositoryImp(
            get<_i26.GetRecommendedCoursesDataSource>(),
            get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i99.GetRecommendedCoursesUseCase>(() =>
      _i99.GetRecommendedCoursesUseCase(
          get<_i97.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i100.GetTopTeachersRepository>(
      () => _i101.GetTopTeachersRepositoryImp(
            get<_i27.GetTopTeachersDataSource>(),
            get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i102.GetTopTeachersUseCase>(
      () => _i102.GetTopTeachersUseCase(get<_i100.GetTopTeachersRepository>()));
  gh.factory<_i103.LessonCommentsStore>(
      () => _i103.LessonCommentsStore(get<_i96.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i104.LessonDetailUseCase>(
      () => _i104.LessonDetailUseCase(get<_i94.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i105.LiveStreamRepository>(
      () => _i106.LiveStreamRepositoryImp(
            dataSource: get<_i29.LiveStreamDataSource>(),
            networkStatus: get<_i39.NetworkStatus>(),
          ));
  gh.lazySingleton<_i107.LiveStreamUseCases>(
      () => _i107.LiveStreamUseCases(get<_i105.LiveStreamRepository>()));
  gh.lazySingleton<_i108.MyCourseRepository>(() => _i109.MyCourseRepositoryImp(
        get<_i38.MyCourseDataSource>(),
        get<_i39.NetworkStatus>(),
      ));
  gh.lazySingleton<_i110.MyCourseUseCase>(() => _i110.MyCourseUseCase(
        get<_i108.MyCourseRepository>(),
        get<_i69.CourseDetailRepository>(),
      ));
  gh.factory<_i111.PaymentStore>(
      () => _i111.PaymentStore(get<_i43.PaymentUseCases>()));
  gh.factory<_i112.SignInStore>(
      () => _i112.SignInStore(get<_i68.AuthUseCase>()));
  gh.factory<_i113.SignUpStore>(
      () => _i113.SignUpStore(get<_i68.AuthUseCase>()));
  gh.factory<_i114.TeacherDetailStore>(
      () => _i114.TeacherDetailStore(get<_i51.TeacherDetailUseCase>()));
  gh.factory<_i115.UpdateAvatarStore>(
      () => _i115.UpdateAvatarStore(get<_i55.UpdateAvatarUseCase>()));
  gh.factory<_i116.UpdateCourseStore>(
      () => _i116.UpdateCourseStore(get<_i110.MyCourseUseCase>()));
  gh.factory<_i117.VerifyEmailStore>(
      () => _i117.VerifyEmailStore(get<_i65.VerifyEmailUseCase>()));
  gh.factory<_i118.CourseDetailStore>(
      () => _i118.CourseDetailStore(get<_i71.CourseDetailUseCases>()));
  gh.factory<_i119.CourseRateStore>(
      () => _i119.CourseRateStore(get<_i74.CourseRateUseCases>()));
  gh.factory<_i120.CreateCourseStore>(
      () => _i120.CreateCourseStore(get<_i110.MyCourseUseCase>()));
  gh.factory<_i121.CreateExamStore>(
      () => _i121.CreateExamStore(get<_i77.CreateExamUseCase>()));
  gh.factory<_i122.DoExamStore>(
      () => _i122.DoExamStore(get<_i80.DoExamUseCase>()));
  gh.factory<_i123.EnrolledCourseStore>(
      () => _i123.EnrolledCourseStore(get<_i84.EnrolledCourseUseCase>()));
  gh.factory<_i124.ForgotPasswordStore>(() => _i124.ForgotPasswordStore(
        get<_i87.ForgotPasswordUseCase>(),
        get<_i93.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i125.GetAllCoursesStore>(
      () => _i125.GetAllCoursesStore(get<_i90.GetAllCoursesUseCase>()));
  gh.factory<_i126.GetRecommendedCoursesStore>(() =>
      _i126.GetRecommendedCoursesStore(
          get<_i99.GetRecommendedCoursesUseCase>()));
  gh.factory<_i127.GetTopTeachersStore>(
      () => _i127.GetTopTeachersStore(get<_i102.GetTopTeachersUseCase>()));
  gh.factory<_i128.LiveStreamStore>(
      () => _i128.LiveStreamStore(get<_i107.LiveStreamUseCases>()));
  gh.factory<_i129.MyCourseStore>(
      () => _i129.MyCourseStore(get<_i110.MyCourseUseCase>()));
  return get;
}
