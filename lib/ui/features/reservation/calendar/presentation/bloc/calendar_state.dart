part of 'calendar_bloc.dart';

enum CalendarStatus {
  loading,
  success,
  error,
}

class CalendarState extends Equatable {
  const CalendarState({
    this.status = CalendarStatus.loading,
    this.schedule = const ScheduleModel.empty(),
  });

  final CalendarStatus status;
  final ScheduleModel schedule;

  CalendarState copyWith({
    CalendarStatus? status,
    ScheduleModel? schedule,
  }) {
    return CalendarState(
      status: status ?? this.status,
      schedule: schedule ?? this.schedule,
    );
  }

  @override
  List<Object?> get props => [
        status,
        schedule,
      ];
}
