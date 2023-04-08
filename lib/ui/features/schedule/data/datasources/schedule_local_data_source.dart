import 'dart:convert';

import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';

abstract class ScheduleLocalDataSource {
  Future<List<ScheduleModel>> getSchedule();
  Future<String> saveSchedule(ScheduleModel schedule);
}

class ScheduleLocalDataSourceImpl implements ScheduleLocalDataSource {
  final storage = Storage.instance;

  @override
  Future<List<ScheduleModel>> getSchedule() async {
    if (!(await storage.hasKey('schedule'))) return [];
    final jsonString = await storage.read('schedule');
    final schedule = json.decode(jsonString) as List;
    return List<ScheduleModel>.from(
      schedule.map(
        (x) => ScheduleModel.fromJson(
          x as Map<String, dynamic>,
        ),
      ),
    );
  }

  @override
  Future<String> saveSchedule(ScheduleModel schedule) async {
    var list = <ScheduleModel>[];
    if (await storage.hasKey('schedule')) {
      final jsonString = await storage.read('schedule');
      list = ScheduleModel.listFromJson(jsonString)..add(schedule);
    } else {
      list = [schedule];
    }
    await storage.write(
      'schedule',
      ScheduleModel.listToJson(list),
    );
    return Future.delayed(const Duration(seconds: 2), () {
      return 'Saved!';
    });
  }
}
