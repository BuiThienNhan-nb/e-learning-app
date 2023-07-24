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
import '../../core/platform/network_status.dart' as _i45;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i26;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i29;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i94;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i100;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i93;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i99;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i95;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i101;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i132;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i27;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i30;
import '../../features/auth/sign_in/data/local/datasources/auth_local_data_source.dart'
    as _i5;
import '../../features/auth/sign_in/data/remote/datasources/auth_remote_data_source.dart'
    as _i7;
import '../../features/auth/sign_in/data/remote/repositories/auth_repository_imp.dart'
    as _i75;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i74;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i76;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i120;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i6;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i121;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i69;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i72;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i71;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i73;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i125;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i70;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i10;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i11;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i78;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i81;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i77;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i80;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i79;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i82;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i126;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i127;
import '../../features/create_exam/data/datasources/create_exam_data_source.dart'
    as _i13;
import '../../features/create_exam/data/repositories/create_exam_repository_imp.dart'
    as _i84;
import '../../features/create_exam/domain/repositories/create_exam_repository.dart'
    as _i83;
import '../../features/create_exam/domain/usecases/create_exam_use_case.dart'
    as _i85;
import '../../features/create_exam/presentation/states/create_exam_provider.dart'
    as _i14;
import '../../features/create_exam/presentation/states/create_exam_store.dart'
    as _i129;
import '../../features/do_exam/data/datasources/do_exam_data_source.dart'
    as _i15;
import '../../features/do_exam/data/repositories/do_exam_repository_imp.dart'
    as _i87;
import '../../features/do_exam/domain/repositories/do_exam_repository.dart'
    as _i86;
import '../../features/do_exam/domain/usecases/do_exam_use_case.dart' as _i88;
import '../../features/do_exam/presentation/state/do_exam_provider.dart'
    as _i16;
import '../../features/do_exam/presentation/state/do_exam_store.dart' as _i130;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i17;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i91;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i90;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i92;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i131;
import '../../features/get_all_courses/data/datasources/get_all_courses_data_source.dart'
    as _i28;
import '../../features/get_all_courses/data/repositories/get_all_courses_repository_imp.dart'
    as _i97;
import '../../features/get_all_courses/domain/repositories/get_all_courses_repository.dart'
    as _i96;
import '../../features/get_all_courses/domain/usecases/get_all_courses_use_case.dart'
    as _i98;
import '../../features/get_all_courses/presentation/state/get_all_courses_store.dart'
    as _i133;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i32;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i33;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i106;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i109;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i105;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i108;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i107;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i110;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i134;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i135;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i31;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i103;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i102;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i55;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i104;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i112;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i111;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i34;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i35;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i114;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i113;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i115;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i136;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i36;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i44;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i117;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i116;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i118;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i128;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i137;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i124;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i12;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i64;
import '../../features/search/data/local/local_fetch_search_history.dart'
    as _i21;
import '../../features/search/data/local/local_save_search_history.dart'
    as _i51;
import '../../features/search/data/remote/remote_fetch_search_result.dart'
    as _i23;
import '../../features/search/domain/repositories/fetch_search_history.dart'
    as _i20;
import '../../features/search/domain/repositories/fetch_search_result.dart'
    as _i22;
import '../../features/search/domain/repositories/save_search_history.dart'
    as _i50;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i46;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i60;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i65;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i48;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i62;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i67;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i47;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i61;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i66;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i49;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i68;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i63;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i89;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i119;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i123;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i54;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i9;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i56;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i58;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i57;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i59;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i122;
import '../../features/top/data/remote_fetch_latest_courses.dart' as _i19;
import '../../features/top/data/remote_fetch_top_rate_courses.dart' as _i25;
import '../../features/top/data/remote_search_by_google_api.dart' as _i53;
import '../../features/top/domain/repositories/fetch_latest_courses.dart'
    as _i18;
import '../../features/top/domain/repositories/fetch_top_rate_courses.dart'
    as _i24;
import '../../features/top/domain/repositories/search_by_google_api.dart'
    as _i52;
import '../../utils/mock/mock_course_reviews.dart' as _i37;
import '../../utils/mock/mock_courses.dart' as _i38;
import '../../utils/mock/mock_faq.dart' as _i40;
import '../../utils/mock/mock_teacher_reviews.dart' as _i41;
import '../../utils/mock/mock_teachers.dart' as _i42;
import '../../utils/mock/mock_transactions.dart' as _i43;
import '../../utils/mock/mocl_exam.dart'
    as _i39; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i18.FetchLatestCourses>(
      () => _i19.RemoteFetchLatestCourses());
  gh.lazySingleton<_i20.FetchSearchHistory>(
      () => _i21.LocalFetchSearchHistory());
  gh.lazySingleton<_i22.FetchSearchResult>(
      () => _i23.RemoteFetchSearchResult());
  gh.lazySingleton<_i24.FetchTopRateCourses>(
      () => _i25.RemoteFetchTopRateCourses());
  gh.lazySingleton<_i26.ForgotPasswordDataSource>(
      () => _i26.ForgotPasswordDataSourceImp());
  gh.factory<_i27.ForgotPasswordPageProvider>(
      () => _i27.ForgotPasswordPageProvider());
  gh.lazySingleton<_i28.GetAllCoursesDataSource>(
      () => _i28.GetAllCoursesDataSourceImp());
  gh.lazySingleton<_i29.GetForgotPasswordCodeDataSource>(
      () => _i29.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i30.GetForgotPasswordCodeProvider>(
      () => _i30.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i31.GetLessonCommentsDataSource>(
      () => _i31.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i32.GetRecommendedCoursesDataSource>(
      () => _i32.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i33.GetTopTeachersDataSource>(
      () => _i33.GetTopTeachersDataSourceImp());
  gh.factory<_i34.LessonDetailPageProvider>(
      () => _i34.LessonDetailPageProvider());
  gh.lazySingleton<_i35.LiveStreamDataSource>(
      () => _i35.LiveStreamDataSourceImp());
  gh.factory<_i36.MainPageStore>(() => _i36.MainPageStore());
  gh.lazySingleton<_i37.MockCourseReviews>(() => _i37.MockCourseReviews());
  gh.lazySingleton<_i38.MockCourses>(() => _i38.MockCourses());
  gh.factory<_i39.MockExam>(() => _i39.MockExam());
  gh.lazySingleton<_i40.MockFAQ>(() => _i40.MockFAQ());
  gh.lazySingleton<_i41.MockTeacherReviews>(() => _i41.MockTeacherReviews());
  gh.lazySingleton<_i42.MockTeachers>(() => _i42.MockTeachers());
  gh.lazySingleton<_i43.MockTransactions>(() => _i43.MockTransactions());
  gh.lazySingleton<_i44.MyCourseDataSource>(() => _i44.MyCourseDataSourceImp());
  gh.factory<_i45.NetworkStatus>(() => _i45.NetworkStatusImp());
  gh.lazySingleton<_i46.PaymentDataSource>(() => _i46.PaymentDataSourceImp());
  gh.lazySingleton<_i47.PaymentRepository>(() => _i48.PaymentRepositoryImp(
        get<_i46.PaymentDataSource>(),
        get<_i45.NetworkStatus>(),
      ));
  gh.lazySingleton<_i49.PaymentUseCases>(
      () => _i49.PaymentUseCases(get<_i47.PaymentRepository>()));
  gh.lazySingleton<_i50.SaveSearchHistory>(() => _i51.LocalSaveSearchHistory());
  gh.lazySingleton<_i52.SearchByGoogleApi>(
      () => _i53.RemoteSearchByGoogleApi());
  gh.factory<_i54.SettingsPageProvider>(() => _i54.SettingsPageProvider());
  gh.factory<_i55.SocketServices>(() => _i55.SocketServices());
  gh.lazySingleton<_i56.TeacherDetailDataSource>(
      () => _i56.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i57.TeacherDetailRepository>(
      () => _i58.TeacherDetailRepositoryImp(
            get<_i45.NetworkStatus>(),
            get<_i56.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i59.TeacherDetailUseCase>(
      () => _i59.TeacherDetailUseCase(get<_i57.TeacherDetailRepository>()));
  gh.lazySingleton<_i60.UpdateAvatarDataSource>(
      () => _i60.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i61.UpdateAvatarRepository>(
      () => _i62.UpdateAvatarRepositoryImp(
            get<_i60.UpdateAvatarDataSource>(),
            get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i63.UpdateAvatarUseCase>(
      () => _i63.UpdateAvatarUseCase(get<_i61.UpdateAvatarRepository>()));
  gh.factory<_i64.UpdateCourseProvider>(() => _i64.UpdateCourseProvider());
  gh.lazySingleton<_i65.UpdateProfileDataSource>(
      () => _i65.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i66.UpdateProfileRepository>(
      () => _i67.UpdateProfileRepositoryImp(
            get<_i65.UpdateProfileDataSource>(),
            get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i68.UpdateProfileUseCase>(
      () => _i68.UpdateProfileUseCase(get<_i66.UpdateProfileRepository>()));
  gh.lazySingleton<_i69.VerifyEmailDataSource>(
      () => _i69.VerifyEmailDataSourceImp());
  gh.factory<_i70.VerifyEmailProvider>(() => _i70.VerifyEmailProvider());
  gh.lazySingleton<_i71.VerifyEmailRepository>(
      () => _i72.VerifyEmailRepositoryImp(
            get<_i69.VerifyEmailDataSource>(),
            get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i73.VerifyEmailUseCase>(
      () => _i73.VerifyEmailUseCase(get<_i71.VerifyEmailRepository>()));
  gh.lazySingleton<_i74.AuthRepository>(() => _i75.AuthRepositoryImp(
        dataSource: get<_i7.AuthRemoteDataSource>(),
        networkStatus: get<_i45.NetworkStatus>(),
      ));
  gh.lazySingleton<_i76.AuthUseCase>(
      () => _i76.AuthUseCase(get<_i74.AuthRepository>()));
  gh.lazySingleton<_i77.CourseDetailRepository>(
      () => _i78.CourseDetailRepositoryImp(
            dataSource: get<_i10.CourseDetailDataSource>(),
            networkStatus: get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i79.CourseDetailUseCases>(
      () => _i79.CourseDetailUseCases(get<_i77.CourseDetailRepository>()));
  gh.lazySingleton<_i80.CourseRateRepository>(
      () => _i81.CourseRateRepositoryImp(
            dataSource: get<_i11.CourseRateDataSource>(),
            networkStatus: get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i82.CourseRateUseCases>(
      () => _i82.CourseRateUseCases(get<_i80.CourseRateRepository>()));
  gh.lazySingleton<_i83.CreateExamRepository>(
      () => _i84.CreateExamRepositoryImp(
            get<_i45.NetworkStatus>(),
            get<_i13.CreateExamDataSource>(),
          ));
  gh.lazySingleton<_i85.CreateExamUseCase>(
      () => _i85.CreateExamUseCase(get<_i83.CreateExamRepository>()));
  gh.lazySingleton<_i86.DoExamRepository>(() => _i87.DoExamRepositoryImp(
        get<_i45.NetworkStatus>(),
        get<_i15.DoExamDataSource>(),
      ));
  gh.lazySingleton<_i88.DoExamUseCase>(
      () => _i88.DoExamUseCase(get<_i86.DoExamRepository>()));
  gh.factory<_i89.EditProfileStore>(
      () => _i89.EditProfileStore(get<_i68.UpdateProfileUseCase>()));
  gh.lazySingleton<_i90.EnrolledCourseRepository>(
      () => _i91.EnrolledCourseRepositoryImp(
            get<_i45.NetworkStatus>(),
            get<_i17.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i92.EnrolledCourseUseCase>(
      () => _i92.EnrolledCourseUseCase(get<_i90.EnrolledCourseRepository>()));
  gh.lazySingleton<_i93.ForgotPasswordRepository>(
      () => _i94.ForgotPasswordRepositoryImp(
            get<_i26.ForgotPasswordDataSource>(),
            get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i95.ForgotPasswordUseCase>(
      () => _i95.ForgotPasswordUseCase(get<_i93.ForgotPasswordRepository>()));
  gh.lazySingleton<_i96.GetAllCoursesRepository>(
      () => _i97.GetAllCoursesRepositoryImp(
            get<_i45.NetworkStatus>(),
            get<_i28.GetAllCoursesDataSource>(),
          ));
  gh.lazySingleton<_i98.GetAllCoursesUseCase>(
      () => _i98.GetAllCoursesUseCase(get<_i96.GetAllCoursesRepository>()));
  gh.lazySingleton<_i99.GetForgotPasswordCodeRepository>(
      () => _i100.GetForgotPasswordCodeRepositoryImp(
            get<_i29.GetForgotPasswordCodeDataSource>(),
            get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i101.GetForgotPasswordCodeUseCase>(() =>
      _i101.GetForgotPasswordCodeUseCase(
          get<_i99.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i102.GetLessonCommentsRepository>(
      () => _i103.GetLessonCommentsRepositoryImp(
            dataSource: get<_i31.GetLessonCommentsDataSource>(),
            networkStatus: get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i104.GetLessonCommentsUseCase>(() =>
      _i104.GetLessonCommentsUseCase(get<_i102.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i105.GetRecommendedCoursesRepository>(
      () => _i106.GetRecommendedCoursesRepositoryImp(
            get<_i32.GetRecommendedCoursesDataSource>(),
            get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i107.GetRecommendedCoursesUseCase>(() =>
      _i107.GetRecommendedCoursesUseCase(
          get<_i105.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i108.GetTopTeachersRepository>(
      () => _i109.GetTopTeachersRepositoryImp(
            get<_i33.GetTopTeachersDataSource>(),
            get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i110.GetTopTeachersUseCase>(
      () => _i110.GetTopTeachersUseCase(get<_i108.GetTopTeachersRepository>()));
  gh.factory<_i111.LessonCommentsStore>(
      () => _i111.LessonCommentsStore(get<_i104.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i112.LessonDetailUseCase>(() =>
      _i112.LessonDetailUseCase(get<_i102.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i113.LiveStreamRepository>(
      () => _i114.LiveStreamRepositoryImp(
            dataSource: get<_i35.LiveStreamDataSource>(),
            networkStatus: get<_i45.NetworkStatus>(),
          ));
  gh.lazySingleton<_i115.LiveStreamUseCases>(
      () => _i115.LiveStreamUseCases(get<_i113.LiveStreamRepository>()));
  gh.lazySingleton<_i116.MyCourseRepository>(() => _i117.MyCourseRepositoryImp(
        get<_i44.MyCourseDataSource>(),
        get<_i45.NetworkStatus>(),
      ));
  gh.lazySingleton<_i118.MyCourseUseCase>(() => _i118.MyCourseUseCase(
        get<_i116.MyCourseRepository>(),
        get<_i77.CourseDetailRepository>(),
      ));
  gh.factory<_i119.PaymentStore>(
      () => _i119.PaymentStore(get<_i49.PaymentUseCases>()));
  gh.factory<_i120.SignInStore>(
      () => _i120.SignInStore(get<_i76.AuthUseCase>()));
  gh.factory<_i121.SignUpStore>(
      () => _i121.SignUpStore(get<_i76.AuthUseCase>()));
  gh.factory<_i122.TeacherDetailStore>(
      () => _i122.TeacherDetailStore(get<_i59.TeacherDetailUseCase>()));
  gh.factory<_i123.UpdateAvatarStore>(
      () => _i123.UpdateAvatarStore(get<_i63.UpdateAvatarUseCase>()));
  gh.factory<_i124.UpdateCourseStore>(
      () => _i124.UpdateCourseStore(get<_i118.MyCourseUseCase>()));
  gh.factory<_i125.VerifyEmailStore>(
      () => _i125.VerifyEmailStore(get<_i73.VerifyEmailUseCase>()));
  gh.factory<_i126.CourseDetailStore>(
      () => _i126.CourseDetailStore(get<_i79.CourseDetailUseCases>()));
  gh.factory<_i127.CourseRateStore>(
      () => _i127.CourseRateStore(get<_i82.CourseRateUseCases>()));
  gh.factory<_i128.CreateCourseStore>(
      () => _i128.CreateCourseStore(get<_i118.MyCourseUseCase>()));
  gh.factory<_i129.CreateExamStore>(
      () => _i129.CreateExamStore(get<_i85.CreateExamUseCase>()));
  gh.factory<_i130.DoExamStore>(
      () => _i130.DoExamStore(get<_i88.DoExamUseCase>()));
  gh.factory<_i131.EnrolledCourseStore>(
      () => _i131.EnrolledCourseStore(get<_i92.EnrolledCourseUseCase>()));
  gh.factory<_i132.ForgotPasswordStore>(() => _i132.ForgotPasswordStore(
        get<_i95.ForgotPasswordUseCase>(),
        get<_i101.GetForgotPasswordCodeUseCase>(),
        get<_i5.AuthLocalDataSource>(),
      ));
  gh.factory<_i133.GetAllCoursesStore>(
      () => _i133.GetAllCoursesStore(get<_i98.GetAllCoursesUseCase>()));
  gh.factory<_i134.GetRecommendedCoursesStore>(() =>
      _i134.GetRecommendedCoursesStore(
          get<_i107.GetRecommendedCoursesUseCase>()));
  gh.factory<_i135.GetTopTeachersStore>(
      () => _i135.GetTopTeachersStore(get<_i110.GetTopTeachersUseCase>()));
  gh.factory<_i136.LiveStreamStore>(
      () => _i136.LiveStreamStore(get<_i115.LiveStreamUseCases>()));
  gh.factory<_i137.MyCourseStore>(
      () => _i137.MyCourseStore(get<_i118.MyCourseUseCase>()));
  return get;
}
