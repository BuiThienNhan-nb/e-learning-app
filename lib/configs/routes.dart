import 'package:e_learning_app/features/create_exam/presentation/pages/create_exam_page.dart';
import 'package:e_learning_app/features/create_exam/presentation/states/create_exam_store.dart';
import 'package:e_learning_app/features/do_exam/presentation/state/do_exam_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../bases/presentation/atoms/bottom_nav_bar.dart';
import '../features/auth/forgot_password/presentation/pages/forgot_password_page.dart';
import '../features/auth/forgot_password/presentation/pages/get_forgot_password_page.dart';
import '../features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart';
import '../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart';
import '../features/auth/forgot_password/presentation/state/providers/get_forgot_password_code_provider.dart';
import '../features/auth/sign_in/presentation/pages/sign_in_page.dart';
import '../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart';
import '../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart';
import '../features/auth/sign_up/presentation/pages/sign_up_page.dart';
import '../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart';
import '../features/auth/verify_email/presentation/pages/verify_email_page.dart';
import '../features/auth/verify_email/presentation/states/mobx/verify_email_store.dart';
import '../features/auth/verify_email/presentation/states/providers/verify_email_provider.dart';
import '../features/course_detail/presentation/pages/course_detail_page.dart';
import '../features/create_exam/presentation/states/create_exam_provider.dart';
import '../features/do_exam/presentation/pages/do_exam_page.dart';
import '../features/do_exam/presentation/state/do_exam_provider.dart';
import '../features/enrolled_courses/presentation/pages/enrolled_courses_page.dart';
import '../features/home/domain/entities/lesson_model.dart';
import '../features/home/domain/entities/section_model.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/lesson_detail/presentation/pages/lesson_detail_page.dart';
import '../features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart';
import '../features/live_stream/presentation/pages/live_stream_page.dart';
import '../features/live_stream/presentation/pages/room_web_view_page.dart';
import '../features/live_stream/presentation/states/mobx/live_stream_store.dart';
import '../features/main/presentation/mobx/main_page_store.dart';
import '../features/main/presentation/pages/main_page.dart';
import '../features/my_courses/presentation/pages/add_course/create_course_page.dart';
import '../features/my_courses/presentation/pages/my_course_page.dart';
import '../features/my_courses/presentation/pages/update_course/update_course_page.dart';
import '../features/my_courses/presentation/pages/update_course/update_section/update_section_lessons_page.dart';
import '../features/my_courses/presentation/states/mobx/create_course_store.dart';
import '../features/my_courses/presentation/states/mobx/my_course_store.dart';
import '../features/my_courses/presentation/states/mobx/update_course_store.dart';
import '../features/my_courses/presentation/states/provider/create_course_provider.dart';
import '../features/my_courses/presentation/states/provider/update_course_provider.dart';
import '../features/my_transactions/presentations/pages/my_transactions_page.dart';
import '../features/my_transactions/presentations/pages/transaction_detail_page.dart';
import '../features/settings/presentation/pages/edit_profile_page.dart';
import '../features/settings/presentation/pages/help_center/help_center_page.dart';
import '../features/settings/presentation/pages/language_select_page.dart';
import '../features/settings/presentation/pages/notification_page.dart';
import '../features/settings/presentation/pages/payment_page.dart';
import '../features/settings/presentation/pages/privacy_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/settings/presentation/pages/test_payment_web_view.dart';
import '../features/settings/presentation/states/mobx/update_avatar_store.dart';
import '../features/settings/presentation/states/provider/settings_page_provider.dart';
import '../features/teacher_detail/presentation/pages/teacher_detail_page.dart';
import '../utils/nav_bar/tab_bar_shell_route.dart';

@lazySingleton
class AppRoutes {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  final _bottomBarLocator = GetIt.I<BottomNavigationBarConfig>();

  // Authentication
  final String signIn = '/sign-in';
  final String signUp = '/sign-up';
  final String verifyEmail = '/verify-email';
  final String getCode = '/forgot-password/get-code';
  final String resetPassword = '/forgot-password/reset-password';

  // Main Page
  final String mainPage = "/main";

  // Live stream
  final String liveStream = "live-stream/:roomId";

  // Detail Page
  late final String teacherDetail = "home/teacher/:teacherId";
  // late final String teacherChat = "$teacherDetail/chat/:id";
  final String courseDetail = "/course/:courseId";
  final String lessonDetail = "/lesson/:lessonId";
  final String transactionDetail = "/transaction/:transactionId";

  // Settings Page
  final String privacyPolicy = "/settings/privacy-policy";
  final String editProfile = "/settings/edit-profile/:userId";
  final String notification = "/settings/notification";
  final String payment = "/settings/payment";
  final String helpCenter = "/settings/help-center";
  final String language = "/settings/language";
  final String myCourses = "settings/my-courses";
  final String createCourse = "/settings/my-courses/create-course";
  final String testPayment = "/settings/test-payment";
  final String updateCourse = "update-course/:courseId";
  final String updateSection = "update-section";
  final String createExam = "exam/:lessonId/create/:lessonTitle";
  final String doExam = "exam/:examId/do";

  String get initial => signIn;
  // String get initial => mainPage;

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initial,
    routes: <RouteBase>[
      GoRoute(
        path: signIn,
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthPageProvider>(
              create: (BuildContext context) => GetIt.I(),
              lazy: true,
            ),
            Provider<SignInStore>(
              create: (_) => GetIt.I(),
              lazy: true,
            ),
          ],
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        path: getCode,
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider<GetForgotPasswordCodeProvider>(
              create: (BuildContext context) => GetIt.I(),
              lazy: true,
            ),
            Provider<ForgotPasswordStore>(
              create: (_) => GetIt.I(),
              lazy: true,
            ),
          ],
          child: const GetForgotPasswordPage(),
        ),
      ),
      GoRoute(
        path: resetPassword,
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider<ForgotPasswordPageProvider>(
              create: (context) => GetIt.I(),
              lazy: true,
            ),
            Provider<ForgotPasswordStore>(
              create: (_) => GetIt.I(),
              lazy: true,
            ),
          ],
          child: const ForgotPasswordPage(),
        ),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthPageProvider>(
              create: (BuildContext context) => GetIt.I(),
              lazy: true,
            ),
            Provider<SignUpStore>(
              create: (_) => GetIt.I(),
              lazy: true,
            ),
          ],
          child: const SignUpPage(),
        ),
      ),
      GoRoute(
        path: verifyEmail,
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider<VerifyEmailProvider>(
              create: (BuildContext context) => GetIt.I(),
              lazy: true,
            ),
            Provider<VerifyEmailStore>(
              create: (_) => GetIt.I(),
              lazy: true,
            ),
          ],
          child: const VerifyEmailPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: mainPage,
        builder: (context, state) => MultiProvider(
          providers: [
            Provider<MainPageStore>(
              create: (context) => GetIt.I(),
              lazy: true,
            ),
            Provider<LiveStreamStore>(
              create: (_) => GetIt.I<LiveStreamStore>(),
              lazy: true,
            ),
          ],
          child: MainPage(),
        ),
        // builder: (context, state) => Provider<MainPageStore>(
        //   create: (context) => GetIt.I(),
        //   lazy: true,
        //   child: MainPage(),
        // ),
        routes: [
          GoRoute(
            name: "teacher_detail",
            path: teacherDetail,
            builder: (context, state) {
              return TeacherDetailPage(
                teacherId: state.params["teacherId"] ?? "N/A",
              );
            },
          ),
          GoRoute(
            // parentNavigatorKey: _rootNavigatorKey,
            name: "my_courses",
            path: myCourses,
            builder: (context, state) {
              return MultiProvider(
                providers: [
                  Provider<CreateCourseStore>(
                    create: (_) => GetIt.I(),
                    lazy: true,
                  ),
                  Provider<MyCourseStore>(
                    create: (_) => GetIt.I(),
                    lazy: true,
                  ),
                  // Provider<UpdateCourseStore>(
                  //   create: (_) => GetIt.I(),
                  //   lazy: true,
                  // ),
                  // ChangeNotifierProvider<UpdateCourseProvider>(
                  //   create: (_) => GetIt.I<UpdateCourseProvider>(),
                  //   lazy: true,
                  // ),
                ],
                child: const MyCoursePage(),
              );
            },
            routes: [
              GoRoute(
                name: 'update_course',
                path: updateCourse,
                builder: (context, state) {
                  return MultiProvider(
                    providers: [
                      Provider<UpdateCourseStore>(
                        create: (_) => GetIt.I<UpdateCourseStore>(),
                        lazy: true,
                      ),
                      ChangeNotifierProvider<UpdateCourseProvider>(
                        create: (_) => GetIt.I<UpdateCourseProvider>(),
                        lazy: true,
                      ),
                    ],
                    child: UpdateCoursePage(
                      courseId: state.params["courseId"] ?? "N/A",
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    name: 'update_section',
                    path: updateSection,
                    builder: (context, state) {
                      List<Object?> extras = state.extra as List<Object?>;

                      return MultiProvider(
                        providers: [
                          Provider<UpdateCourseStore>(
                            create: (_) => extras[2] as UpdateCourseStore,
                            lazy: false,
                          ),
                          ChangeNotifierProvider<UpdateCourseProvider>(
                            create: (_) => extras[0] as UpdateCourseProvider,
                            lazy: false,
                          ),
                        ],
                        child: UpdateSectionLessonsPage(
                          section: extras[1] as SectionModel,
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        name: "create_exam",
                        path: createExam,
                        builder: (context, state) => MultiProvider(
                          providers: [
                            ChangeNotifierProvider<CreateExamProvider>(
                              create: (_) => GetIt.I(),
                              lazy: true,
                            ),
                            Provider<CreateExamStore>(
                              create: (_) => GetIt.I(),
                              lazy: true,
                            ),
                          ],
                          child: CreateExamPage(
                            lessonId: state.params["lessonId"] ?? "",
                            lessonTitle: state.params["lessonTitle"] ?? "",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: "live_stream",
            path: liveStream,
            builder: (context, state) {
              return Provider<LiveStreamStore>(
                create: (_) => state.extra as LiveStreamStore,
                lazy: true,
                child: RoomWebViewPage(
                  // id: state.extra as String,
                  id: state.params["roomId"] ?? "N/A",
                ),
              );
            },
          ),
        ],
      ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   name: "teacher_detail",
      //   path: teacherDetail,
      //   builder: (context, state) {
      //     // final teacher = state.extra as TeacherModel;
      //     return TeacherDetailPage(
      //       teacherId: state.params["teacherId"] ?? "N/A",
      //     );
      //   },
      // ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   name: "teacher_chat",
      //   path: teacherChat,
      //   builder: (context, state) => const ChatPage(),
      // ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "course_detail",
        path: courseDetail,
        builder: (context, state) {
          return CourseDetailPage(
            courseId: state.params["courseId"] ?? "N/A",
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "lesson_detail",
        path: lessonDetail,
        builder: (context, state) {
          final LessonModel lesson = state.extra as LessonModel;
          return Provider(
            create: (context) => GetIt.I<LessonDetailPageProvider>(),
            child: LessonDetailPage(
              lesson: lesson,
              lessonId: state.params["lessonId"] ?? "N/A",
            ),
          );
        },
        routes: [
          GoRoute(
            name: "do_exam",
            path: doExam,
            builder: (context, state) => MultiProvider(
              providers: [
                ChangeNotifierProvider<DoExamProvider>(
                  create: (_) => GetIt.I(),
                  lazy: true,
                ),
                Provider<DoExamStore>(
                  create: (_) => GetIt.I(),
                  lazy: true,
                ),
              ],
              child: DoExamPage(
                examId: state.params["examId"] ?? "",
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "transaction_detail",
        path: transactionDetail,
        builder: (context, state) {
          return const TransactionDetailPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "edit_profile",
        path: editProfile,
        builder: (context, state) {
          return EditProfilePage(
            userId: state.params["userId"] ?? "N/A",
          );
        },
      ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   name: "my_courses",
      //   path: myCourses,
      //   builder: (context, state) {
      //     return MultiProvider(
      //       providers: [
      //         ChangeNotifierProvider<MyCoursesProvider>(
      //           create: (_) => GetIt.I(),
      //           // lazy: true,
      //         ),
      //       ],
      //       child: const MyCoursePage(),
      //     );
      //   },
      // ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "create_course",
        path: createCourse,
        builder: (context, state) {
          return MultiProvider(
            providers: [
              Provider<CreateCourseStore>(
                create: (_) => GetIt.I(),
                lazy: true,
              ),
              Provider<CreateCourseProvider>(
                create: (_) => GetIt.I(),
                lazy: true,
              ),
            ],
            child: const CreateCoursePage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "privacy_policy",
        path: privacyPolicy,
        builder: (context, state) {
          return PrivacyPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "test_payment",
        path: testPayment,
        builder: (context, state) {
          return const TestPaymentWebView();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "notification",
        path: notification,
        builder: (context, state) {
          return const NotificationPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "payment",
        path: payment,
        builder: (context, state) {
          return const PaymentPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "help_center",
        path: helpCenter,
        builder: (context, state) {
          return const HelpCenterPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "language",
        path: language,
        builder: (context, state) {
          return const LanguageSelectPage();
        },
      ),
      BottomTabBarShellRoute(
        tabs: _bottomBarLocator.tabs,
        routes: [
          GoRoute(
            path: _bottomBarLocator.mainPage[0],
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: _bottomBarLocator.mainPage[1],
            builder: (context, state) => const LiveStreamPage(),
          ),
          GoRoute(
            path: _bottomBarLocator.mainPage[2],
            builder: (context, state) => const EnrolledCoursesPage(),
          ),
          GoRoute(
            path: _bottomBarLocator.mainPage[3],
            builder: (context, state) => const MyTransactionsPage(),
          ),
          GoRoute(
            path: _bottomBarLocator.mainPage[4],
            builder: (context, state) => MultiProvider(
              providers: [
                ChangeNotifierProvider<SettingsPageProvider>(
                  create: (BuildContext context) => GetIt.I(),
                  lazy: true,
                ),
                Provider<UpdateAvatarStore>(
                  create: (_) => GetIt.I(),
                  lazy: true,
                ),
              ],
              child: const SettingsPage(),
            ),
          ),
        ],
      ),
    ],
  );
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          // onPressed: () => GoRouter.of(context).replace('/sign-in'),
          onPressed: () =>
              GoRouter.of(context).push("/test/nested-scroll-view"),
          child: const Text("Log out!"),
        ),
      ),
    );
  }
}
