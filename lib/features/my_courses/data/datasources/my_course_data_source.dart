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
import '../../../home/domain/entities/course_model.dart';
import '../../../home/domain/entities/section_model.dart';

abstract class MyCourseDataSource {
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
  final String _updateCourse = "/courses/update";
  final String _updateCourseSection = "/sections/update";
  final String _createCourseSection = "/sections/create";
  final String _deleteCourseSection = "/sections/delete";
  // final String _testId = '5700874b-d2ca-47a8-ac38-4304ad9608b9';

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
                "videos/courses/${course.id}/lesson_${lesson.order}";
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
      log(Env.instance.baseUrl + _createCourseEndpoint);
      log(requestData.toString());

      final data = await post(
        Env.instance.baseUrl + _createCourseEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );
      // await Future.delayed(const Duration(seconds: 2));
      log(data["data"]["data"]["courseId"]);
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
    const String storagePath =
        "images/courses/courseImage/5700874b-d2ca-47a8-ac38-4304ad9608b9";
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
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
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
      log(requestData.toString());

      final data = await post(
        Env.instance.baseUrl + _updateCourseSection,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
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
      log(requestData.toString());

      final data = await post(
        Env.instance.baseUrl + _createCourseSection,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
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
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );

      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
