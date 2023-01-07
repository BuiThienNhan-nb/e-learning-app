import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:random_date/random_date.dart';

import '../../core/app/values.dart';
import '../../features/auth/sign_in/domain/entities/image_model.dart';
import '../../features/auth/sign_in/domain/entities/teacher_model.dart';
import '../../features/auth/sign_in/domain/entities/user_model.dart';

@lazySingleton
class MockTeachers {
  final _random = Random();

  int _teacherIndex = 0;

  final List<String> _names = [
    "Julian Wan",
    "Vicky Hladynets",
    "Jake Nackos",
    "Sigmund",
    "Christopher Campbell",
    "Joseph Gonzalez",
    "Christian Buehner",
  ];

  final List<String> _avatars = [
    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80",
    "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ];

  final List<ImageModel> _avatars1 = [
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
      blurHash: "LLHn?Bs:.mS\$-:t6WBjZENRkrrs.",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      blurHash: "LRI;VLIU0fs,00^+%NoL.TRk,:Ri",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80",
      blurHash: "LgP6%5jZ?wbIE1fk%1aeo~ofROWC",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      blurHash: "L48gpm-;000000RO%Ox_GdkD}nr;",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      blurHash: "LPGcJskWK+wb_Noer=NG.TRjRQt7",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      blurHash: "LDH.KN?b1*Os009EyDRjp{o#ve%1",
    ),
    const ImageModel(
      url:
          "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      blurHash: "LXNAuE_N%NDi?HR%NGV@Nae.aKtl",
    ),
  ];

  late final List<TeacherModel> topTeachers = [
    TeacherModel(
      user: UserModel(
        id: "$_teacherIndex",
        name: _names[_teacherIndex],
        email: "${_names[_teacherIndex]}@gmail.com",
        birthday: RandomDate.withRange(1960, 1990).random(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender[_random.nextInt(2)],
        avatar: _avatars[_teacherIndex++],
        phoneNumber: "",
        isPremium: _random.nextBool(),
        courseJoined: const [],
      ),
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
    ),
    TeacherModel(
      user: UserModel(
        id: "$_teacherIndex",
        name: _names[_teacherIndex],
        email: "${_names[_teacherIndex]}@gmail.com",
        birthday: RandomDate.withRange(1960, 1990).random(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender[_random.nextInt(2)],
        avatar: _avatars[_teacherIndex++],
        phoneNumber: "",
        isPremium: _random.nextBool(),
        courseJoined: const [],
      ),
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
    ),
    TeacherModel(
      user: UserModel(
        id: "$_teacherIndex",
        name: _names[_teacherIndex],
        email: "${_names[_teacherIndex]}@gmail.com",
        birthday: RandomDate.withRange(1960, 1990).random(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender[_random.nextInt(2)],
        avatar: _avatars[_teacherIndex++],
        phoneNumber: "",
        isPremium: _random.nextBool(),
        courseJoined: const [],
      ),
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
    ),
    TeacherModel(
      user: UserModel(
        id: "$_teacherIndex",
        name: _names[_teacherIndex],
        email: "${_names[_teacherIndex]}@gmail.com",
        birthday: RandomDate.withRange(1960, 1990).random(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender[_random.nextInt(2)],
        avatar: _avatars[_teacherIndex++],
        phoneNumber: "",
        isPremium: _random.nextBool(),
        courseJoined: const [],
      ),
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
    ),
    TeacherModel(
      user: UserModel(
        id: "$_teacherIndex",
        name: _names[_teacherIndex],
        email: "${_names[_teacherIndex]}@gmail.com",
        birthday: RandomDate.withRange(1960, 1990).random(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender[_random.nextInt(2)],
        avatar: _avatars[_teacherIndex++],
        phoneNumber: "",
        isPremium: _random.nextBool(),
        courseJoined: const [],
      ),
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
    ),
    TeacherModel(
      user: UserModel(
        id: "$_teacherIndex",
        name: _names[_teacherIndex],
        email: "${_names[_teacherIndex]}@gmail.com",
        birthday: RandomDate.withRange(1960, 1990).random(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender[_random.nextInt(2)],
        avatar: _avatars[_teacherIndex++],
        phoneNumber: "",
        isPremium: _random.nextBool(),
        courseJoined: const [],
      ),
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
    ),
    TeacherModel(
      user: UserModel(
        id: "$_teacherIndex",
        name: _names[_teacherIndex],
        email: "${_names[_teacherIndex]}@gmail.com",
        birthday: RandomDate.withRange(1960, 1990).random(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender[_random.nextInt(2)],
        avatar: _avatars[_teacherIndex++],
        phoneNumber: "",
        isPremium: _random.nextBool(),
        courseJoined: const [],
      ),
      rates: (_random.nextInt(5) + _random.nextDouble()),
      votes: _random.nextInt(40000),
    ),
  ];
}
