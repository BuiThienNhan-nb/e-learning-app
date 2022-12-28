import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

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
  Future<Either<Failure, bool>> deleteCourse(String courseId);
}

@LazySingleton(as: MyCourseDataSource)
class MyCourseDataSourceImp extends Api implements MyCourseDataSource {
  final String _createCourseEndpoint =
      "/courses/createCourseWithSectionAndLesson";
  final String _updateCourse = "/courses/update";
  final String _updateCourseSection = "/sections/update";

  @override
  Future<Either<Failure, CourseModel>> createCourse(CourseModel course) async {
    try {
      final Map<String, Object> requestData = course.toMap();
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
    requestData['courseId'] = '5700874b-d2ca-47a8-ac38-4304ad9608b9';

    try {
      if (isUpdateImage) {
        String? downloadUrl;
        final File file = File(course.image);
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
}
