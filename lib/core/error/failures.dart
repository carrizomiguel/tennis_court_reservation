import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({
    this.caption,
  });

  final String? caption;

  @override
  List<Object?> get props => [caption];
}

class CacheFailure extends Failure {}

class EmptyFailure extends Failure {}

class BadRequestFailure extends Failure {}

class SocketFailure extends Failure {}
