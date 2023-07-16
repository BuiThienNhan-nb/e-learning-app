import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/data/local/datasources/auth_local_data_source.dart';
import '../../../top/domain/entities/course_model.dart';
import '../../../home/domain/entities/section_model.dart';

abstract class MyCourseDataSource {
  Future<Either<Failure, List<CourseModel>>> getMyCourses();
  Future<Either<Failure, CourseModel>> createCourse(CourseModel course);
  Future<Either<Failure, CourseModel>> updateCourseInformation(
    CourseModel course,
    bool isUpdateImage,
  );
  Future<Either<Failure, SectionModel>> updateCourseSection(
    SectionModel section,
    final String courseId,
  );
  Future<Either<Failure, SectionModel>> createCourseSection(
    SectionModel section,
    String courseId,
  );
  Future<Either<Failure, bool>> deleteCourse(String courseId);
  Future<Either<Failure, bool>> deleteSection(
    String courseId,
    String sectionId,
  );
}

@LazySingleton(as: MyCourseDataSource)
class MyCourseDataSourceImp extends Api implements MyCourseDataSource {
  final String _createCourseEndpoint =
      "/courses/createCourseWithSectionAndLesson";
  final String _getCourseByTeacher = "/courses/getCourseByTeacher";
  final String _updateCourse = "/courses/update";
  final String _updateCourseSection = "/sections/update";
  final String _createCourseSection = "/sections/create";
  final String _deleteCourseSection = "/sections/delete";
  // final String _testId = '5700874b-d2ca-47a8-ac38-4304ad9608b9';

  @override
  Future<Either<Failure, List<CourseModel>>> getMyCourses() async {
    try {
      final requestData = {
        "authorId": GetIt.I<AppProvider>().user.id,
      };

      final data = await post(
        Env.instance.baseUrl + _getCourseByTeacher,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      List<CourseModel> courses = (data["data"]["data"] as List)
          .map(
            (map) => CourseModel.fromMap(map),
          )
          .toList();

      return Right(courses);
    } catch (e) {
      return left(UserFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CourseModel>> createCourse(CourseModel course) async {
    final storageRef = FirebaseStorage.instance.ref();

    try {
      for (var section in course.section) {
        for (var lesson in section.lessons) {
          if (lesson.videoUrl != null &&
              lesson.videoUrl!.compareTo("N/A") != 0) {
            // upload course source video to firebase
            final String storagePath =
                "videos/courses/lessonVideo/lesson_${DateTime.now().millisecondsSinceEpoch}";
            String? downloadUrl;
            final File file = File(lesson.videoUrl!);
            VideoPlayerController controller = VideoPlayerController.file(file);
            lesson.length = controller.value.duration.inMinutes;

            await storageRef.child(storagePath).putFile(file).then(
                  (uploadTask) async =>
                      downloadUrl = await uploadTask.ref.getDownloadURL(),
                );
            file.delete();
            lesson.videoUrl = downloadUrl;
          } else {
            lesson.videoUrl = null;
          }
        }
      }

      final Map<String, Object?> requestData = course.toMap();
      if ((requestData["image"] as String).compareTo("") == 0) {
        requestData["image"] == null;
      } else {
        final String storagePath =
            "images/courses/courseImage/course_${DateTime.now().millisecondsSinceEpoch}";
        String? downloadUrl;
        final File file = File(course.image!);
        await storageRef.child(storagePath).putFile(file).then(
              (uploadTask) async =>
                  downloadUrl = await uploadTask.ref.getDownloadURL(),
            );
        requestData['image'] = downloadUrl!;
      }

      final data = await post(
        Env.instance.baseUrl + _createCourseEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );
      // await Future.delayed(const Duration(seconds: 2));
      print(data["data"]["data"]["courseId"]);
      course.id = data["data"]["data"]["courseId"];

      return Right(course);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(String courseId) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CourseModel>> updateCourseInformation(
    CourseModel course,
    bool isUpdateImage,
  ) async {
    final storageRef = FirebaseStorage.instance.ref();
    final String storagePath = "images/courses/courseImage/${course.id}";
    final requestData = course.informationToMap();
    // requestData['courseId'] = course.id;

    try {
      if (isUpdateImage) {
        String? downloadUrl;
        final File file = File(course.image!);
        await storageRef.child(storagePath).putFile(file).then(
              (uploadTask) async =>
                  downloadUrl = await uploadTask.ref.getDownloadURL(),
            );
        file.delete();
        requestData['image'] = downloadUrl!;
      }

      final data = await post(
        Env.instance.baseUrl + _updateCourse,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );

      return Right(CourseModel.fromMap(data['data']['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SectionModel>> updateCourseSection(
    SectionModel section,
    String courseId,
  ) async {
    try {
      final requestData = section.toMap();
      requestData['courseId'] = courseId;
      requestData['sectionId'] = section.id;
      print(requestData.toString());

      final data = await post(
        Env.instance.baseUrl + _updateCourseSection,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );

      return Right(SectionModel.fromMap(data['data']['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SectionModel>> createCourseSection(
      SectionModel section, String courseId) async {
    try {
      final requestData = section.toMap();
      requestData['courseId'] = courseId;
      print(requestData.toString());

      final data = await post(
        Env.instance.baseUrl + _createCourseSection,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );

      return Right(SectionModel.fromMap(data['data']['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteSection(
      String courseId, String sectionId) async {
    try {
      final requestData = {
        "sectionId": sectionId,
        "courseId": courseId,
      };
      final data = await post(
        Env.instance.baseUrl + _deleteCourseSection,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );

      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
