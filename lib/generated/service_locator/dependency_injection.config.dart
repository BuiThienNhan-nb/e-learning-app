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
import '../../core/platform/network_status.dart' as _i36;
import '../../features/auth/forgot_password/data/datasources/forgot_password_data_source.dart'
    as _i17;
import '../../features/auth/forgot_password/data/datasources/get_forgot_password_code_data_source.dart'
    as _i20;
import '../../features/auth/forgot_password/data/repositories/forgot_password_repository_imp.dart'
    as _i81;
import '../../features/auth/forgot_password/data/repositories/get_forgot_password_code_repository_imp.dart'
    as _i87;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i80;
import '../../features/auth/forgot_password/domain/repositories/get_forgot_password_code_repository.dart'
    as _i86;
import '../../features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart'
    as _i82;
import '../../features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart'
    as _i88;
import '../../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart'
    as _i119;
import '../../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart'
    as _i18;
import '../../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart'
    as _i21;
import '../../features/auth/sign_in/data/datasources/auth_remote_data_source.dart'
    as _i6;
import '../../features/auth/sign_in/data/repositories/auth_repository_imp.dart'
    as _i62;
import '../../features/auth/sign_in/domain/repositories/auth_repository.dart'
    as _i61;
import '../../features/auth/sign_in/domain/usecases/auth_use_case.dart' as _i63;
import '../../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart'
    as _i107;
import '../../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart'
    as _i5;
import '../../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart'
    as _i108;
import '../../features/auth/verify_email/data/datasources/verify_email_data_source.dart'
    as _i56;
import '../../features/auth/verify_email/data/repositories/verify_email_repository_imp.dart'
    as _i59;
import '../../features/auth/verify_email/domain/repositories/verify_email_repository.dart'
    as _i58;
import '../../features/auth/verify_email/domain/usecases/verify_email_use_case.dart'
    as _i60;
import '../../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart'
    as _i112;
import '../../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart'
    as _i57;
import '../../features/course_detail/data/datasources/course_detail_data_source.dart'
    as _i9;
import '../../features/course_detail/data/datasources/course_rate_data_source.dart'
    as _i10;
import '../../features/course_detail/data/repositories/course_detail_reposiory_imp.dart'
    as _i65;
import '../../features/course_detail/data/repositories/course_rate_repository_imp.dart'
    as _i68;
import '../../features/course_detail/domain/repositories/course_detail_repository.dart'
    as _i64;
import '../../features/course_detail/domain/repositories/course_rate_repository.dart'
    as _i67;
import '../../features/course_detail/domain/usecases/course_detail_use_cases.dart'
    as _i66;
import '../../features/course_detail/domain/usecases/course_rate_use_cases.dart'
    as _i69;
import '../../features/course_detail/presentation/states/course_detail_store.dart'
    as _i113;
import '../../features/course_detail/presentation/states/course_rate_store.dart'
    as _i114;
import '../../features/create_exam/data/datasources/create_exam_data_source.dart'
    as _i12;
import '../../features/create_exam/data/repositories/create_exam_repository_imp.dart'
    as _i71;
import '../../features/create_exam/domain/repositories/create_exam_repository.dart'
    as _i70;
import '../../features/create_exam/domain/usecases/create_exam_use_case.dart'
    as _i72;
import '../../features/create_exam/presentation/states/create_exam_provider.dart'
    as _i13;
import '../../features/create_exam/presentation/states/create_exam_store.dart'
    as _i116;
import '../../features/do_exam/data/datasources/do_exam_data_source.dart'
    as _i14;
import '../../features/do_exam/data/repositories/do_exam_repository_imp.dart'
    as _i74;
import '../../features/do_exam/domain/repositories/do_exam_repository.dart'
    as _i73;
import '../../features/do_exam/domain/usecases/do_exam_use_case.dart' as _i75;
import '../../features/do_exam/presentation/state/do_exam_provider.dart'
    as _i15;
import '../../features/do_exam/presentation/state/do_exam_store.dart' as _i117;
import '../../features/enrolled_courses/data/datasources/enrolled_course_data_source.dart'
    as _i16;
import '../../features/enrolled_courses/data/repositories/enrolled_course_repository_imp.dart'
    as _i78;
import '../../features/enrolled_courses/domain/repositories/enrolled_course_repository.dart'
    as _i77;
import '../../features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart'
    as _i79;
import '../../features/enrolled_courses/states/mobx/enrolled_course_store.dart'
    as _i118;
import '../../features/get_all_courses/data/datasources/get_all_courses_data_source.dart'
    as _i19;
import '../../features/get_all_courses/data/repositories/get_all_courses_repository_imp.dart'
    as _i84;
import '../../features/get_all_courses/domain/repositories/get_all_courses_repository.dart'
    as _i83;
import '../../features/get_all_courses/domain/usecases/get_all_courses_use_case.dart'
    as _i85;
import '../../features/get_all_courses/presentation/state/get_all_courses_store.dart'
    as _i120;
import '../../features/home/data/datasources/get_rcm_courses_data_source.dart'
    as _i23;
import '../../features/home/data/datasources/get_top_teacher_data_source.dart'
    as _i24;
import '../../features/home/data/repositories/get_rcm_courses_repository_imp.dart'
    as _i93;
import '../../features/home/data/repositories/get_top_teachers_repository_imp.dart'
    as _i96;
import '../../features/home/domain/repositories/get_rcm_courses_repository.dart'
    as _i92;
import '../../features/home/domain/repositories/get_top_teacher_repository.dart'
    as _i95;
import '../../features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart'
    as _i94;
import '../../features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart'
    as _i97;
import '../../features/home/presentation/states/lesson/get_rcm_courses_store.dart'
    as _i121;
import '../../features/home/presentation/states/teacher/get_top_teachers_store.dart'
    as _i122;
import '../../features/lesson_detail/data/datasources/get_lesson_comments_data_source.dart'
    as _i22;
import '../../features/lesson_detail/data/repositories/get_lesson_comments_repository_imp.dart'
    as _i90;
import '../../features/lesson_detail/domain/repositories/get_lesson_comments.dart'
    as _i89;
import '../../features/lesson_detail/domain/services/socket_service.dart'
    as _i42;
import '../../features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart'
    as _i91;
import '../../features/lesson_detail/domain/usecases/lesson_detail_use_cases.dart'
    as _i99;
import '../../features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart'
    as _i98;
import '../../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart'
    as _i25;
import '../../features/live_stream/data/datasources/live_stream_data_source.dart'
    as _i26;
import '../../features/live_stream/data/repositories/live_stream_repository_imp.dart'
    as _i101;
import '../../features/live_stream/domain/repositories/live_stream_repository.dart'
    as _i100;
import '../../features/live_stream/domain/usecases/live_stream_use_cases.dart'
    as _i102;
import '../../features/live_stream/presentation/states/mobx/live_stream_store.dart'
    as _i123;
import '../../features/main/presentation/mobx/main_page_store.dart' as _i27;
import '../../features/my_courses/data/datasources/my_course_data_source.dart'
    as _i35;
import '../../features/my_courses/data/repositories/my_course_repository_imp.dart'
    as _i104;
import '../../features/my_courses/domain/repositories/my_course_repository.dart'
    as _i103;
import '../../features/my_courses/domain/usecases/my_course_use_case.dart'
    as _i105;
import '../../features/my_courses/presentation/states/mobx/create_course_store.dart'
    as _i115;
import '../../features/my_courses/presentation/states/mobx/my_course_store.dart'
    as _i124;
import '../../features/my_courses/presentation/states/mobx/update_course_store.dart'
    as _i111;
import '../../features/my_courses/presentation/states/provider/create_course_provider.dart'
    as _i11;
import '../../features/my_courses/presentation/states/provider/update_course_provider.dart'
    as _i51;
import '../../features/settings/data/datasources/payment_repository_data_source.dart'
    as _i37;
import '../../features/settings/data/datasources/update_avatar_data_source.dart'
    as _i47;
import '../../features/settings/data/datasources/update_profile_data_source.dart'
    as _i52;
import '../../features/settings/data/repositories/payment_repository_imp.dart'
    as _i39;
import '../../features/settings/data/repositories/update_avatar_repository_imp.dart'
    as _i49;
import '../../features/settings/data/repositories/update_profile_repository_imp.dart'
    as _i54;
import '../../features/settings/domain/repositories/payment_repository.dart'
    as _i38;
import '../../features/settings/domain/repositories/update_avatar_repository.dart'
    as _i48;
import '../../features/settings/domain/repositories/update_profile_repository.dart'
    as _i53;
import '../../features/settings/domain/usecases/payment_use_cases.dart' as _i40;
import '../../features/settings/domain/usecases/update_profile_use_case.dart'
    as _i55;
import '../../features/settings/domain/usecases/upload_avatar_use_case.dart'
    as _i50;
import '../../features/settings/presentation/states/mobx/edit_profile_store.dart'
    as _i76;
import '../../features/settings/presentation/states/mobx/payment_store.dart'
    as _i106;
import '../../features/settings/presentation/states/mobx/update_avatar_store.dart'
    as _i110;
import '../../features/settings/presentation/states/provider/settings_page_provider.dart'
    as _i41;
import '../../features/social_chat/presentation/states/provider/chat_provider.dart'
    as _i8;
import '../../features/teacher_detail/data/datasources/teacher_detail_data_source.dart'
    as _i43;
import '../../features/teacher_detail/data/repositories/teacher_detail_repository_imp.dart'
    as _i45;
import '../../features/teacher_detail/domain/repositories/teacher_detail_repository.dart'
    as _i44;
import '../../features/teacher_detail/domain/usecases/teacher_detail_use_case.dart'
    as _i46;
import '../../features/teacher_detail/presentation/states/teacher_detail_store.dart'
    as _i109;
import '../../utils/mock/mock_course_reviews.dart' as _i28;
import '../../utils/mock/mock_courses.dart' as _i29;
import '../../utils/mock/mock_faq.dart' as _i31;
import '../../utils/mock/mock_teacher_reviews.dart' as _i32;
import '../../utils/mock/mock_teachers.dart' as _i33;
import '../../utils/mock/mock_transactions.dart' as _i34;
import '../../utils/mock/mocl_exam.dart'
    as _i30; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i19.GetAllCoursesDataSource>(
      () => _i19.GetAllCoursesDataSourceImp());
  gh.lazySingleton<_i20.GetForgotPasswordCodeDataSource>(
      () => _i20.GetForgotPasswordCodeDataSourceImp());
  gh.factory<_i21.GetForgotPasswordCodeProvider>(
      () => _i21.GetForgotPasswordCodeProvider());
  gh.lazySingleton<_i22.GetLessonCommentsDataSource>(
      () => _i22.GetLessonCommentsDataSourceImp());
  gh.lazySingleton<_i23.GetRecommendedCoursesDataSource>(
      () => _i23.GetRecommendedCoursesDataSourceImp());
  gh.lazySingleton<_i24.GetTopTeachersDataSource>(
      () => _i24.GetTopTeachersDataSourceImp());
  gh.factory<_i25.LessonDetailPageProvider>(
      () => _i25.LessonDetailPageProvider());
  gh.lazySingleton<_i26.LiveStreamDataSource>(
      () => _i26.LiveStreamDataSourceImp());
  gh.factory<_i27.MainPageStore>(() => _i27.MainPageStore());
  gh.lazySingleton<_i28.MockCourseReviews>(() => _i28.MockCourseReviews());
  gh.lazySingleton<_i29.MockCourses>(() => _i29.MockCourses());
  gh.factory<_i30.MockExam>(() => _i30.MockExam());
  gh.lazySingleton<_i31.MockFAQ>(() => _i31.MockFAQ());
  gh.lazySingleton<_i32.MockTeacherReviews>(() => _i32.MockTeacherReviews());
  gh.lazySingleton<_i33.MockTeachers>(() => _i33.MockTeachers());
  gh.lazySingleton<_i34.MockTransactions>(() => _i34.MockTransactions());
  gh.lazySingleton<_i35.MyCourseDataSource>(() => _i35.MyCourseDataSourceImp());
  gh.factory<_i36.NetworkStatus>(() => _i36.NetworkStatusImp());
  gh.lazySingleton<_i37.PaymentDataSource>(() => _i37.PaymentDataSourceImp());
  gh.lazySingleton<_i38.PaymentRepository>(() => _i39.PaymentRepositoryImp(
        get<_i37.PaymentDataSource>(),
        get<_i36.NetworkStatus>(),
      ));
  gh.lazySingleton<_i40.PaymentUseCases>(
      () => _i40.PaymentUseCases(get<_i38.PaymentRepository>()));
  gh.factory<_i41.SettingsPageProvider>(() => _i41.SettingsPageProvider());
  gh.factory<_i42.SocketServices>(() => _i42.SocketServices());
  gh.lazySingleton<_i43.TeacherDetailDataSource>(
      () => _i43.TeacherDetailDataSourceImp());
  gh.lazySingleton<_i44.TeacherDetailRepository>(
      () => _i45.TeacherDetailRepositoryImp(
            get<_i36.NetworkStatus>(),
            get<_i43.TeacherDetailDataSource>(),
          ));
  gh.lazySingleton<_i46.TeacherDetailUseCase>(
      () => _i46.TeacherDetailUseCase(get<_i44.TeacherDetailRepository>()));
  gh.lazySingleton<_i47.UpdateAvatarDataSource>(
      () => _i47.UpdateAvatarDataSourceImp());
  gh.lazySingleton<_i48.UpdateAvatarRepository>(
      () => _i49.UpdateAvatarRepositoryImp(
            get<_i47.UpdateAvatarDataSource>(),
            get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i50.UpdateAvatarUseCase>(
      () => _i50.UpdateAvatarUseCase(get<_i48.UpdateAvatarRepository>()));
  gh.factory<_i51.UpdateCourseProvider>(() => _i51.UpdateCourseProvider());
  gh.lazySingleton<_i52.UpdateProfileDataSource>(
      () => _i52.UpdateProfileDataSourceImp());
  gh.lazySingleton<_i53.UpdateProfileRepository>(
      () => _i54.UpdateProfileRepositoryImp(
            get<_i52.UpdateProfileDataSource>(),
            get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i55.UpdateProfileUseCase>(
      () => _i55.UpdateProfileUseCase(get<_i53.UpdateProfileRepository>()));
  gh.lazySingleton<_i56.VerifyEmailDataSource>(
      () => _i56.VerifyEmailDataSourceImp());
  gh.factory<_i57.VerifyEmailProvider>(() => _i57.VerifyEmailProvider());
  gh.lazySingleton<_i58.VerifyEmailRepository>(
      () => _i59.VerifyEmailRepositoryImp(
            get<_i56.VerifyEmailDataSource>(),
            get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i60.VerifyEmailUseCase>(
      () => _i60.VerifyEmailUseCase(get<_i58.VerifyEmailRepository>()));
  gh.lazySingleton<_i61.AuthRepository>(() => _i62.AuthRepositoryImp(
        dataSource: get<_i6.AuthRemoteDataSource>(),
        networkStatus: get<_i36.NetworkStatus>(),
      ));
  gh.lazySingleton<_i63.AuthUseCase>(
      () => _i63.AuthUseCase(get<_i61.AuthRepository>()));
  gh.lazySingleton<_i64.CourseDetailRepository>(
      () => _i65.CourseDetailRepositoryImp(
            dataSource: get<_i9.CourseDetailDataSource>(),
            networkStatus: get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i66.CourseDetailUseCases>(
      () => _i66.CourseDetailUseCases(get<_i64.CourseDetailRepository>()));
  gh.lazySingleton<_i67.CourseRateRepository>(
      () => _i68.CourseRateRepositoryImp(
            dataSource: get<_i10.CourseRateDataSource>(),
            networkStatus: get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i69.CourseRateUseCases>(
      () => _i69.CourseRateUseCases(get<_i67.CourseRateRepository>()));
  gh.lazySingleton<_i70.CreateExamRepository>(
      () => _i71.CreateExamRepositoryImp(
            get<_i36.NetworkStatus>(),
            get<_i12.CreateExamDataSource>(),
          ));
  gh.lazySingleton<_i72.CreateExamUseCase>(
      () => _i72.CreateExamUseCase(get<_i70.CreateExamRepository>()));
  gh.lazySingleton<_i73.DoExamRepository>(() => _i74.DoExamRepositoryImp(
        get<_i36.NetworkStatus>(),
        get<_i14.DoExamDataSource>(),
      ));
  gh.lazySingleton<_i75.DoExamUseCase>(
      () => _i75.DoExamUseCase(get<_i73.DoExamRepository>()));
  gh.factory<_i76.EditProfileStore>(
      () => _i76.EditProfileStore(get<_i55.UpdateProfileUseCase>()));
  gh.lazySingleton<_i77.EnrolledCourseRepository>(
      () => _i78.EnrolledCourseRepositoryImp(
            get<_i36.NetworkStatus>(),
            get<_i16.EnrolledCourseDataSource>(),
          ));
  gh.lazySingleton<_i79.EnrolledCourseUseCase>(
      () => _i79.EnrolledCourseUseCase(get<_i77.EnrolledCourseRepository>()));
  gh.lazySingleton<_i80.ForgotPasswordRepository>(
      () => _i81.ForgotPasswordRepositoryImp(
            get<_i17.ForgotPasswordDataSource>(),
            get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i82.ForgotPasswordUseCase>(
      () => _i82.ForgotPasswordUseCase(get<_i80.ForgotPasswordRepository>()));
  gh.lazySingleton<_i83.GetAllCoursesRepository>(
      () => _i84.GetAllCoursesRepositoryImp(
            get<_i36.NetworkStatus>(),
            get<_i19.GetAllCoursesDataSource>(),
          ));
  gh.lazySingleton<_i85.GetAllCoursesUseCase>(
      () => _i85.GetAllCoursesUseCase(get<_i83.GetAllCoursesRepository>()));
  gh.lazySingleton<_i86.GetForgotPasswordCodeRepository>(
      () => _i87.GetForgotPasswordCodeRepositoryImp(
            get<_i20.GetForgotPasswordCodeDataSource>(),
            get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i88.GetForgotPasswordCodeUseCase>(() =>
      _i88.GetForgotPasswordCodeUseCase(
          get<_i86.GetForgotPasswordCodeRepository>()));
  gh.lazySingleton<_i89.GetLessonCommentsRepository>(
      () => _i90.GetLessonCommentsRepositoryImp(
            dataSource: get<_i22.GetLessonCommentsDataSource>(),
            networkStatus: get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i91.GetLessonCommentsUseCase>(() =>
      _i91.GetLessonCommentsUseCase(get<_i89.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i92.GetRecommendedCoursesRepository>(
      () => _i93.GetRecommendedCoursesRepositoryImp(
            get<_i23.GetRecommendedCoursesDataSource>(),
            get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i94.GetRecommendedCoursesUseCase>(() =>
      _i94.GetRecommendedCoursesUseCase(
          get<_i92.GetRecommendedCoursesRepository>()));
  gh.lazySingleton<_i95.GetTopTeachersRepository>(
      () => _i96.GetTopTeachersRepositoryImp(
            get<_i24.GetTopTeachersDataSource>(),
            get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i97.GetTopTeachersUseCase>(
      () => _i97.GetTopTeachersUseCase(get<_i95.GetTopTeachersRepository>()));
  gh.factory<_i98.LessonCommentsStore>(
      () => _i98.LessonCommentsStore(get<_i91.GetLessonCommentsUseCase>()));
  gh.lazySingleton<_i99.LessonDetailUseCase>(
      () => _i99.LessonDetailUseCase(get<_i89.GetLessonCommentsRepository>()));
  gh.lazySingleton<_i100.LiveStreamRepository>(
      () => _i101.LiveStreamRepositoryImp(
            dataSource: get<_i26.LiveStreamDataSource>(),
            networkStatus: get<_i36.NetworkStatus>(),
          ));
  gh.lazySingleton<_i102.LiveStreamUseCases>(
      () => _i102.LiveStreamUseCases(get<_i100.LiveStreamRepository>()));
  gh.lazySingleton<_i103.MyCourseRepository>(() => _i104.MyCourseRepositoryImp(
        get<_i35.MyCourseDataSource>(),
        get<_i36.NetworkStatus>(),
      ));
  gh.lazySingleton<_i105.MyCourseUseCase>(() => _i105.MyCourseUseCase(
        get<_i103.MyCourseRepository>(),
        get<_i64.CourseDetailRepository>(),
      ));
  gh.factory<_i106.PaymentStore>(
      () => _i106.PaymentStore(get<_i40.PaymentUseCases>()));
  gh.factory<_i107.SignInStore>(
      () => _i107.SignInStore(get<_i63.AuthUseCase>()));
  gh.factory<_i108.SignUpStore>(
      () => _i108.SignUpStore(get<_i63.AuthUseCase>()));
  gh.factory<_i109.TeacherDetailStore>(
      () => _i109.TeacherDetailStore(get<_i46.TeacherDetailUseCase>()));
  gh.factory<_i110.UpdateAvatarStore>(
      () => _i110.UpdateAvatarStore(get<_i50.UpdateAvatarUseCase>()));
  gh.factory<_i111.UpdateCourseStore>(
      () => _i111.UpdateCourseStore(get<_i105.MyCourseUseCase>()));
  gh.factory<_i112.VerifyEmailStore>(
      () => _i112.VerifyEmailStore(get<_i60.VerifyEmailUseCase>()));
  gh.factory<_i113.CourseDetailStore>(
      () => _i113.CourseDetailStore(get<_i66.CourseDetailUseCases>()));
  gh.factory<_i114.CourseRateStore>(
      () => _i114.CourseRateStore(get<_i69.CourseRateUseCases>()));
  gh.factory<_i115.CreateCourseStore>(
      () => _i115.CreateCourseStore(get<_i105.MyCourseUseCase>()));
  gh.factory<_i116.CreateExamStore>(
      () => _i116.CreateExamStore(get<_i72.CreateExamUseCase>()));
  gh.factory<_i117.DoExamStore>(
      () => _i117.DoExamStore(get<_i75.DoExamUseCase>()));
  gh.factory<_i118.EnrolledCourseStore>(
      () => _i118.EnrolledCourseStore(get<_i79.EnrolledCourseUseCase>()));
  gh.factory<_i119.ForgotPasswordStore>(() => _i119.ForgotPasswordStore(
        get<_i82.ForgotPasswordUseCase>(),
        get<_i88.GetForgotPasswordCodeUseCase>(),
      ));
  gh.factory<_i120.GetAllCoursesStore>(
      () => _i120.GetAllCoursesStore(get<_i85.GetAllCoursesUseCase>()));
  gh.factory<_i121.GetRecommendedCoursesStore>(() =>
      _i121.GetRecommendedCoursesStore(
          get<_i94.GetRecommendedCoursesUseCase>()));
  gh.factory<_i122.GetTopTeachersStore>(
      () => _i122.GetTopTeachersStore(get<_i97.GetTopTeachersUseCase>()));
  gh.factory<_i123.LiveStreamStore>(
      () => _i123.LiveStreamStore(get<_i102.LiveStreamUseCases>()));
  gh.factory<_i124.MyCourseStore>(
      () => _i124.MyCourseStore(get<_i105.MyCourseUseCase>()));
  return get;
}
