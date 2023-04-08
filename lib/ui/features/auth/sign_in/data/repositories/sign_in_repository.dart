import 'package:oxidized/oxidized.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/auth/sign_in/sign_in.dart';

abstract class SignInRepository {
  Future<Result<UserModel, Failure>> signIn(String email, String password);
}

class SignInRepositoryImpl implements SignInRepository {
  SignInRepositoryImpl({
    required this.remoteDataSource,
  });

  final SignInRemoteDataSource remoteDataSource;

  @override
  Future<Result<UserModel, Failure>> signIn(
    String email,
    String password,
  ) async {
    try {
      final remote = await remoteDataSource.singIn(email, password);
      return Result.ok(remote);
    } on BadRequestException {
      return Result.err(BadRequestFailure());
    }
  }
}
