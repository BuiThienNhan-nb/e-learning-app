import 'dart:developer';
import 'dart:io';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;

import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/app/provider.dart';

abstract class UpdateAvatarDataSource {
  Future<Either<Failure, bool>> updateAvatar(String path);
}

@LazySingleton(as: UpdateAvatarDataSource)
class UpdateAvatarDataSourceImp implements UpdateAvatarDataSource {
  final String storagePath =
      "images/users/avatar/${GetIt.I<AppProvider>().user.id}";
  @override
  Future<Either<Failure, bool>> updateAvatar(String path) async {
    final storageRef = FirebaseStorage.instance.ref();

    try {
      final File file = File(path);
      await storageRef.child(storagePath).putFile(file);

      // Create blur hash from image
      final data = file.readAsBytesSync();
      final image = img.decodeImage(data);
      final blur = BlurHash.encode(image!);

      log(blur.hash);
      file.delete();

      return const Right(true);
    } catch (e) {
      return const Left(
        ServerFailure(
            "Error when uploaded avatar to Storage!! Try again or later!"),
      );
    }
  }
}
