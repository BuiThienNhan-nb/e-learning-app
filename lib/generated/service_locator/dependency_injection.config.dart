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
import '../../core/platform/network_status.dart' as _i41;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i22;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i25;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i88;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i94;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i87;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i93;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i89;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i95;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i126;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i23;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i26;
import '../../features/auth/sign_in/data/local/datasources/auth_local_data_source.dart'
    as _i5;
import '../../features/auth/sign_in/data/remote/datasources/auth_remote_data_source.dart'
    as _i7;
import '../../features/auth/sign_in/data/remote/repositories/auth_repository_imp.dart'
    as _i69;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i68;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i70;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i114;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i6;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i115;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i63;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i66;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i65;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i67;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i119;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i64;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i10;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i11;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i72;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i75;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i71;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i74;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i73;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i76;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i120;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i121;
import '../../features/create_exam/data/datasources/create_exam_data_source.dart'
    as _i13;
import '../../features/create_exam/data/repositories/create_exam_repository_imp.dart'
    as _i78;
import '../../features/create_exam/domain/repositories/create_exam_repository.dart'
    as _i77;
import '../../features/create_exam/domain/usecases/create_exam_use_case.dart'
    as _i79;
import '../../features/create_exam/presentation/states/create_exam_provider.dart'
    as _i14;
import '../../features/create_exam/presentation/states/create_exam_store.dart'
    as _i123;
import '../../features/do_exam/data/datasources/do_exam_data_source.dart'
    as _i15;
import '../../features/do_exam/data/repositories/do_exam_repository_imp.dart'
    as _i81;
import '../../features/do_exam/domain/repositories/do_exam_repository.dart'
    as _i80;
import '../../features/do_exam/domain/usecases/do_exam_use_case.dart' as _i82;
import '../../features/do_exam/presentation/state/do_exam_provider.dart'
    as _i16;
import '../../features/do_exam/presentation/state/do_exam_store.dart' as _i124;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i17;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i85;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i84;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i86;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i125;
import '../../features/get_all_courses/data/datasources/get_all_courses_data_source.dart'
    as _i24;
import '../../features/get_all_courses/data/repositories/get_all_courses_repository_imp.dart'
    as _i91;
import '../../features/get_all_courses/domain/repositories/get_all_courses_repository.dart'
    as _i90;
import '../../features/get_all_courses/domain/usecases/get_all_courses_use_case.dart'
    as _i92;
import '../../features/get_all_courses/presentation/state/get_all_courses_store.dart'
    as _i127;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i28;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i29;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i100;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i103;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i99;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i102;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i101;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i104;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i128;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i129;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i27;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i97;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i96;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i49;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i98;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i106;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i105;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i30;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i31;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i108;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i107;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i109;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i130;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i32;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i40;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i111;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i110;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i112;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i122;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i131;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i118;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i12;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i58;
import '../../features/search/data/local/local_fetch_search_history.dart'
    as _i19;
import '../../features/search/data/local/local_save_search_history.dart'
    as _i47;
import '../../features/search/data/remote/remote_fetch_search_result.dart'
    as _i21;
import '../../features/search/domain/repositories/fetch_search_history.dart'
    as _i18;
import '../../features/search/domain/repositories/fetch_search_result.dart'
    as _i20;
import '../../features/search/domain/repositories/save_search_history.dart'
    as _i46;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i42;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i54;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i59;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i44;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i56;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i61;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i43;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i55;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i60;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i45;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i62;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i57;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i83;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i113;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i117;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i48;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i9;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i50;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i52;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i51;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i53;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i116;
import '../../utils/mock/mock_course_reviews.dart' as _i33;
import '../../utils/mock/mock_courses.dart' as _i34;
import '../../utils/mock/mock_faq.dart' as _i36;
import '../../utils/mock/mock_teacher_reviews.dart' as _i37;
import '../../utils/mock/mock_teachers.dart' as _i38;
import '../../utils/mock/mock_transactions.dart' as _i39;
import '../../utils/mock/mocl_exam.dart'
    as _i35; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i20.FetchSearchResult>(
      () => _i21.RemoteFetchSearchResult());
  gh.lazySingleton<_i22.ForgotPasswordDataSource>(
      () => _i22.ForgotPasswordDataSourceImp());
  gh.factory<_i23.ForgotPasswordPageProvider>(
      () => _i23.ForgotPasswordPageProvider());
  gh.lazySingleton<_i24.GetAllCoursesDataSource>(
      () => _i24.GetAllCoursesDataSourceImp());
  gh.lazySingleton<_i25.GetForgotPasswordCodeDataSource>(
      () => _i25.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i26.GetForgotPasswordCodeProvider>(
      () => _i26.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i27.GetLessonCommentsDataSource>(
      () => _i27.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i28.GetRecommendedCoursesDataSource>(
      () => _i28.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i29.GetTopTeachersDataSource>(
      () => _i29.GetTopTeachersDataSourceImp());
  gh.factory<_i30.LessonDetailPageProvider>(
      () => _i30.LessonDetailPageProvider());
  gh.lazySingleton<_i31.LiveStreamDataSource>(
      () => _i31.LiveStreamDataSourceImp());
  gh.factory<_i32.MainPageStore>(() => _i32.MainPageStore());
  gh.lazySingleton<_i33.MockCourseReviews>(() => _i33.MockCourseReviews());
  gh.lazySingleton<_i34.MockCourses>(() => _i34.MockCourses());
  gh.factory<_i35.MockExam>(() => _i35.MockExam());
  gh.lazySingleton<_i36.MockFAQ>(() => _i36.MockFAQ());
  gh.lazySingleton<_i37.MockTeacherReviews>(() => _i37.MockTeacherReviews());
  gh.lazySingleton<_i38.MockTeachers>(() => _i38.MockTeachers());
  gh.lazySingleton<_i39.MockTransactions>(() => _i39.MockTransactions());
  gh.lazySingleton<_i40.MyCourseDataSource>(() => _i40.MyCourseDataSourceImp());
  gh.factory<_i41.NetworkStatus>(() => _i41.NetworkStatusImp());
  gh.lazySingleton<_i42.PaymentDataSource>(() => _i42.PaymentDataSourceImp());
  gh.lazySingleton<_i43.PaymentRepository>(() => _i44.PaymentRepositoryImp(
        get<_i42.PaymentDataSource>(),
        get<_i41.NetworkStatus>(),
      ));
  gh.lazySingleton<_i45.PaymentUseCases>(
      () => _i45.PaymentUseCases(get<_i43.PaymentRepository>()));
  gh.lazySingleton<_i46.SaveSearchHistory>(() => _i47.LocalSaveSearchHistory());
  gh.factory<_i48.SettingsPageProvider>(() => _i48.SettingsPageProvider());
  gh.factory<_i49.SocketServices>(() => _i49.SocketServices());
  gh.lazySingleton<_i50.TeacherDetailDataSource>(
      () => _i50.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i51.TeacherDetailRepository>(
      () => _i52.TeacherDetailRepositoryImp(
            get<_i41.NetworkStatus>(),
            get<_i50.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i53.TeacherDetailUseCase>(
      () => _i53.TeacherDetailUseCase(get<_i51.TeacherDetailRepository>()));
  gh.lazySingleton<_i54.UpdateAvatarDataSource>(
      () => _i54.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i55.UpdateAvatarRepository>(
      () => _i56.UpdateAvatarRepositoryImp(
            get<_i54.UpdateAvatarDataSource>(),
            get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i57.UpdateAvatarUseCase>(
      () => _i57.UpdateAvatarUseCase(get<_i55.UpdateAvatarRepository>()));
  gh.factory<_i58.UpdateCourseProvider>(() => _i58.UpdateCourseProvider());
  gh.lazySingleton<_i59.UpdateProfileDataSource>(
      () => _i59.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i60.UpdateProfileRepository>(
      () => _i61.UpdateProfileRepositoryImp(
            get<_i59.UpdateProfileDataSource>(),
            get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i62.UpdateProfileUseCase>(
      () => _i62.UpdateProfileUseCase(get<_i60.UpdateProfileRepository>()));
  gh.lazySingleton<_i63.VerifyEmailDataSource>(
      () => _i63.VerifyEmailDataSourceImp());
  gh.factory<_i64.VerifyEmailProvider>(() => _i64.VerifyEmailProvider());
  gh.lazySingleton<_i65.VerifyEmailRepository>(
      () => _i66.VerifyEmailRepositoryImp(
            get<_i63.VerifyEmailDataSource>(),
            get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i67.VerifyEmailUseCase>(
      () => _i67.VerifyEmailUseCase(get<_i65.VerifyEmailRepository>()));
  gh.lazySingleton<_i68.AuthRepository>(() => _i69.AuthRepositoryImp(
        dataSource: get<_i7.AuthRemoteDataSource>(),
        networkStatus: get<_i41.NetworkStatus>(),
      ));
  gh.lazySingleton<_i70.AuthUseCase>(
      () => _i70.AuthUseCase(get<_i68.AuthRepository>()));
  gh.lazySingleton<_i71.CourseDetailRepository>(
      () => _i72.CourseDetailRepositoryImp(
            dataSource: get<_i10.CourseDetailDataSource>(),
            networkStatus: get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i73.CourseDetailUseCases>(
      () => _i73.CourseDetailUseCases(get<_i71.CourseDetailRepository>()));
  gh.lazySingleton<_i74.CourseRateRepository>(
      () => _i75.CourseRateRepositoryImp(
            dataSource: get<_i11.CourseRateDataSource>(),
            networkStatus: get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i76.CourseRateUseCases>(
      () => _i76.CourseRateUseCases(get<_i74.CourseRateRepository>()));
  gh.lazySingleton<_i77.CreateExamRepository>(
      () => _i78.CreateExamRepositoryImp(
            get<_i41.NetworkStatus>(),
            get<_i13.CreateExamDataSource>(),
          ));
  gh.lazySingleton<_i79.CreateExamUseCase>(
      () => _i79.CreateExamUseCase(get<_i77.CreateExamRepository>()));
  gh.lazySingleton<_i80.DoExamRepository>(() => _i81.DoExamRepositoryImp(
        get<_i41.NetworkStatus>(),
        get<_i15.DoExamDataSource>(),
      ));
  gh.lazySingleton<_i82.DoExamUseCase>(
      () => _i82.DoExamUseCase(get<_i80.DoExamRepository>()));
  gh.factory<_i83.EditProfileStore>(
      () => _i83.EditProfileStore(get<_i62.UpdateProfileUseCase>()));
  gh.lazySingleton<_i84.EnrolledCourseRepository>(
      () => _i85.EnrolledCourseRepositoryImp(
            get<_i41.NetworkStatus>(),
            get<_i17.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i86.EnrolledCourseUseCase>(
      () => _i86.EnrolledCourseUseCase(get<_i84.EnrolledCourseRepository>()));
  gh.lazySingleton<_i87.ForgotPasswordRepository>(
      () => _i88.ForgotPasswordRepositoryImp(
            get<_i22.ForgotPasswordDataSource>(),
            get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i89.ForgotPasswordUseCase>(
      () => _i89.ForgotPasswordUseCase(get<_i87.ForgotPasswordRepository>()));
  gh.lazySingleton<_i90.GetAllCoursesRepository>(
      () => _i91.GetAllCoursesRepositoryImp(
            get<_i41.NetworkStatus>(),
            get<_i24.GetAllCoursesDataSource>(),
          ));
  gh.lazySingleton<_i92.GetAllCoursesUseCase>(
      () => _i92.GetAllCoursesUseCase(get<_i90.GetAllCoursesRepository>()));
  gh.lazySingleton<_i93.GetForgotPasswordCodeRepository>(
      () => _i94.GetForgotPasswordCodeRepositoryImp(
            get<_i25.GetForgotPasswordCodeDataSource>(),
            get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i95.GetForgotPasswordCodeUseCase>(() =>
      _i95.GetForgotPasswordCodeUseCase(
          get<_i93.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i96.GetLessonCommentsRepository>(
      () => _i97.GetLessonCommentsRepositoryImp(
            dataSource: get<_i27.GetLessonCommentsDataSource>(),
            networkStatus: get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i98.GetLessonCommentsUseCase>(() =>
      _i98.GetLessonCommentsUseCase(get<_i96.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i99.GetRecommendedCoursesRepository>(
      () => _i100.GetRecommendedCoursesRepositoryImp(
            get<_i28.GetRecommendedCoursesDataSource>(),
            get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i101.GetRecommendedCoursesUseCase>(() =>
      _i101.GetRecommendedCoursesUseCase(
          get<_i99.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i102.GetTopTeachersRepository>(
      () => _i103.GetTopTeachersRepositoryImp(
            get<_i29.GetTopTeachersDataSource>(),
            get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i104.GetTopTeachersUseCase>(
      () => _i104.GetTopTeachersUseCase(get<_i102.GetTopTeachersRepository>()));
  gh.factory<_i105.LessonCommentsStore>(
      () => _i105.LessonCommentsStore(get<_i98.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i106.LessonDetailUseCase>(
      () => _i106.LessonDetailUseCase(get<_i96.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i107.LiveStreamRepository>(
      () => _i108.LiveStreamRepositoryImp(
            dataSource: get<_i31.LiveStreamDataSource>(),
            networkStatus: get<_i41.NetworkStatus>(),
          ));
  gh.lazySingleton<_i109.LiveStreamUseCases>(
      () => _i109.LiveStreamUseCases(get<_i107.LiveStreamRepository>()));
  gh.lazySingleton<_i110.MyCourseRepository>(() => _i111.MyCourseRepositoryImp(
        get<_i40.MyCourseDataSource>(),
        get<_i41.NetworkStatus>(),
      ));
  gh.lazySingleton<_i112.MyCourseUseCase>(() => _i112.MyCourseUseCase(
        get<_i110.MyCourseRepository>(),
        get<_i71.CourseDetailRepository>(),
      ));
  gh.factory<_i113.PaymentStore>(
      () => _i113.PaymentStore(get<_i45.PaymentUseCases>()));
  gh.factory<_i114.SignInStore>(
      () => _i114.SignInStore(get<_i70.AuthUseCase>()));
  gh.factory<_i115.SignUpStore>(
      () => _i115.SignUpStore(get<_i70.AuthUseCase>()));
  gh.factory<_i116.TeacherDetailStore>(
      () => _i116.TeacherDetailStore(get<_i53.TeacherDetailUseCase>()));
  gh.factory<_i117.UpdateAvatarStore>(
      () => _i117.UpdateAvatarStore(get<_i57.UpdateAvatarUseCase>()));
  gh.factory<_i118.UpdateCourseStore>(
      () => _i118.UpdateCourseStore(get<_i112.MyCourseUseCase>()));
  gh.factory<_i119.VerifyEmailStore>(
      () => _i119.VerifyEmailStore(get<_i67.VerifyEmailUseCase>()));
  gh.factory<_i120.CourseDetailStore>(
      () => _i120.CourseDetailStore(get<_i73.CourseDetailUseCases>()));
  gh.factory<_i121.CourseRateStore>(
      () => _i121.CourseRateStore(get<_i76.CourseRateUseCases>()));
  gh.factory<_i122.CreateCourseStore>(
      () => _i122.CreateCourseStore(get<_i112.MyCourseUseCase>()));
  gh.factory<_i123.CreateExamStore>(
      () => _i123.CreateExamStore(get<_i79.CreateExamUseCase>()));
  gh.factory<_i124.DoExamStore>(
      () => _i124.DoExamStore(get<_i82.DoExamUseCase>()));
  gh.factory<_i125.EnrolledCourseStore>(
      () => _i125.EnrolledCourseStore(get<_i86.EnrolledCourseUseCase>()));
  gh.factory<_i126.ForgotPasswordStore>(() => _i126.ForgotPasswordStore(
        get<_i89.ForgotPasswordUseCase>(),
        get<_i95.GetForgotPasswordCodeUseCase>(),
        get<_i5.AuthLocalDataSource>(),
      ));
  gh.factory<_i127.GetAllCoursesStore>(
      () => _i127.GetAllCoursesStore(get<_i92.GetAllCoursesUseCase>()));
  gh.factory<_i128.GetRecommendedCoursesStore>(() =>
      _i128.GetRecommendedCoursesStore(
          get<_i101.GetRecommendedCoursesUseCase>()));
  gh.factory<_i129.GetTopTeachersStore>(
      () => _i129.GetTopTeachersStore(get<_i104.GetTopTeachersUseCase>()));
  gh.factory<_i130.LiveStreamStore>(
      () => _i130.LiveStreamStore(get<_i109.LiveStreamUseCases>()));
  gh.factory<_i131.MyCourseStore>(
      () => _i131.MyCourseStore(get<_i112.MyCourseUseCase>()));
  return get;
}
