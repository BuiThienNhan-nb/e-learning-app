import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/bases/services/api_exception.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';

abstract class UpdateAvatarDataSource {
  Future<Either<Failure, bool>> updateAvatar(String path);
}

@LazySingleton(as: UpdateAvatarDataSource)
class UpdateAvatarDataSourceImp extends Api implements UpdateAvatarDataSource {
  final String _storagePath =
      "images/users/avatar/${GetIt.I<AppProvider>().user.id}";
  final String _updateProfileEndPoint = "/users/profile/update";

  @override
  Future<Either<Failure, bool>> updateAvatar(String path) async {
    final storageRef = FirebaseStorage.instance.ref();

    try {
      String? downloadUrl;
      final File file = File(path);
      await storageRef.child(_storagePath).putFile(file).then(
            (uploadTask) async =>
                downloadUrl = await uploadTask.ref.getDownloadURL(),
          );

      // Create blur hash from image
      // final data = file.readAsBytesSync();
      // final image = img.decodeImage(data);
      // final blur = BlurHash.encode(image!);
      // log(blur.hash);
      file.delete();
      GetIt.I<AppProvider>().user.avatar = downloadUrl;
      final Map<String, Object?> requestData = {
        "userId": GetIt.I<AppProvider>().user.id,
        "avatar": downloadUrl,
      };

      final data = await post(
        Env.instance.baseUrl + _updateProfileEndPoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );

      return const Right(true);
    } catch (e) {
      return const Left(
        ServerFailure(
            "Error when uploaded avatar to Storage!! Try again or later!"),
      );
    }
  }
}
