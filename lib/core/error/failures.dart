import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();

  String? get message => null;
}

class ServerFailure extends Failure {
  @override
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class UserFailure extends Failure {
  @override
  final String message;

  const UserFailure(this.message);

  @override
  List<Object?> get props => [message];
}
