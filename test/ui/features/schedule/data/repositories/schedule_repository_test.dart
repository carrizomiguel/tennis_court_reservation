import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';

class MockScheduleLocalDataSource extends Mock
    implements ScheduleLocalDataSource {}

void main() {
  late MockScheduleLocalDataSource mockLocalDataSource;
  late ScheduleRepositoryImpl repository;

  setUp(() {
    mockLocalDataSource = MockScheduleLocalDataSource();
    repository = ScheduleRepositoryImpl(
      localDataSource: mockLocalDataSource,
    );
  });

  group('Schedule Repository', () {
    test('get schedule succesfully', () async {
      when(
        () => mockLocalDataSource.getSchedule(),
      ).thenAnswer((_) async => <ScheduleModel>[]);
      final result = await repository.getSchedule();
      expect(result, isA<Ok>());
    });

    test('save schedule successfully', () async {
      const schedule = ScheduleModel.empty();
      when(
        () => mockLocalDataSource.saveSchedule(schedule),
      ).thenAnswer((_) async => 'Saved!');
      final result = await repository.saveSchedule(schedule);
      expect(result, isA<Ok>());
    });
  });
}
