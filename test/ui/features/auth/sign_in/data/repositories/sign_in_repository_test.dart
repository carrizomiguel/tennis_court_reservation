import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';

class MockSignInRemoteDataSource extends Mock
    implements SignInRemoteDataSource {}

void main() {
  late MockSignInRemoteDataSource mockRemoteDataSouce;
  late SignInRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSouce = MockSignInRemoteDataSource();
    repository = SignInRepositoryImpl(
      remoteDataSource: mockRemoteDataSouce,
    );
  });

  group('Sign In Repository', () {
    test('should login and return user successfully', () async {
      const email = 'jhondoe@gmail.com';
      const password = '123456';
      const user = UserModel.empty();
      when(
        () => mockRemoteDataSouce.singIn(email, password),
      ).thenAnswer((_) async => user);
      final result = await repository.signIn(email, password);
      expect(result, isA<Ok>());
    });
  });
}
