import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';

void main() {
  late ScheduleLocalDataSourceImpl localDataSource;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Storage.initialize();
    localDataSource = ScheduleLocalDataSourceImpl();
  });

  group('Schedule Data Source', () {
    group('Get schedule when exists in Storage', () {
      test('should return the schedule successfully', () async {
        final result = await localDataSource.getSchedule();
        expect(result, isA<List<ScheduleModel>>());
      });

      test('should save the schedule successfully', () async {
        final schedule = ScheduleModel(
          court: const CourtModel.empty(),
          date: DateTime.now(),
        );
        final result = await localDataSource.saveSchedule(schedule);
        expect(result, isA<String>());
      });
    });
  });
}
