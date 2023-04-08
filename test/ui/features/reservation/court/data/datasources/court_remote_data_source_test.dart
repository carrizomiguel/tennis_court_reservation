import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';

void main() {
  late CourtRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    remoteDataSource = CourtRemoteDataSourceImpl();
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Court Data Source', () {
    test('should return courts list successfully', () async {
      final result = await remoteDataSource.getCourts();
      expect(result, isA<List<CourtModel>>());
    });
  });
}
