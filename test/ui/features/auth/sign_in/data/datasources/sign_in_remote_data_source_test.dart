import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';

void main() {
  late SignInRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    remoteDataSource = SignInRemoteDataSourceImpl();
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Sign In Data Source', () {
    test('should log in successfully', () async {
      const email = 'jhondoe@gmail.com';
      const password = '123456';
      final result = await remoteDataSource.singIn(email, password);
      expect(result, isA<UserModel>());
    });
  });
}
