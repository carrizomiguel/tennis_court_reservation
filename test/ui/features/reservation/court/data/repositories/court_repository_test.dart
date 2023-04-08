import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';

class MockCourtRemoteDataSource extends Mock implements CourtRemoteDataSource {}

void main() {
  late MockCourtRemoteDataSource mockRemoteDataSouce;
  late CourtRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSouce = MockCourtRemoteDataSource();
    repository = CourtRepositoryImpl(
      remoteDataSource: mockRemoteDataSouce,
    );
  });

  group('Court Repository', () {
    test('should request and return courts list successfully', () async {
      const list = [CourtModel.empty()];
      when(
        () => mockRemoteDataSouce.getCourts(),
      ).thenAnswer((_) async => list);
      final result = await repository.getCourts();
      expect(result, isA<Ok>());
    });
  });
}
