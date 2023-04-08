import 'package:oxidized/oxidized.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';

abstract class ScheduleRepository {
  Future<Result<List<ScheduleModel>, Failure>> getSchedule();
  Future<Result<String, Failure>> saveSchedule(ScheduleModel schedule);
}

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl({
    required this.localDataSource,
  });

  final ScheduleLocalDataSource localDataSource;

  @override
  Future<Result<List<ScheduleModel>, Failure>> getSchedule() async {
    try {
      final local = await localDataSource.getSchedule();
      return Result.ok(local);
    } catch (_) {
      return Result.err(BadRequestFailure());
    }
  }

  @override
  Future<Result<String, Failure>> saveSchedule(ScheduleModel schedule) async {
    try {
      final local = await localDataSource.saveSchedule(schedule);
      return Result.ok(local);
    } catch (_) {
      return Result.err(BadRequestFailure());
    }
  }
}
