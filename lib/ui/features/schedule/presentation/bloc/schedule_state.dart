part of 'schedule_bloc.dart';

enum ScheduleStatus {
  loading,
  empty,
  success,
  error,
}

class ScheduleState extends Equatable {
  const ScheduleState({
    this.status = ScheduleStatus.loading,
    this.schedule = const [],
  });

  final ScheduleStatus status;
  final List<ScheduleModel> schedule;

  ScheduleState copyWith({
    ScheduleStatus? status,
    List<ScheduleModel>? schedule,
  }) {
    return ScheduleState(
      status: status ?? this.status,
      schedule: schedule ?? this.schedule,
    );
  }

  @override
  List<Object> get props => [
        status,
        schedule,
      ];
}
