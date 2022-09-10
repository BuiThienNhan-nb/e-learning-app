import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [];
}

class UserFailure extends Failure {
  final String message;

  const UserFailure(this.message);

  @override
  List<Object?> get props => [];
}
