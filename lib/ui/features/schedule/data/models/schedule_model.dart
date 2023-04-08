import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

class ScheduleModel extends Equatable {
  const ScheduleModel({
    required this.court,
    required this.date,
  });

  const ScheduleModel.empty()
      : this(
          court: const CourtModel.empty(),
          date: null,
        );

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      court: CourtModel.fromJson(json['court'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'court': court.toJson(),
      'date': date!.toIso8601String(),
    };
  }

  static List<ScheduleModel> listFromJson(String list) {
    final decoded = json.decode(list) as List;
    return List<ScheduleModel>.from(
      decoded.map(
        (x) => ScheduleModel.fromJson(
          x as Map<String, dynamic>,
        ),
      ),
    );
  }

  static String listToJson(List<ScheduleModel> list) {
    return json.encode(
      List<dynamic>.from(
        list.map(
          (x) => x.toJson(),
        ),
      ),
    );
  }

  final CourtModel court;
  final DateTime? date;

  static List<int> hours = [8, 10, 12, 14, 16, 18];

  ScheduleModel copyWith({
    CourtModel? court,
    DateTime? date,
    WeatherModel? weather,
  }) {
    return ScheduleModel(
      court: court ?? this.court,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        court,
        date,
      ];
}
