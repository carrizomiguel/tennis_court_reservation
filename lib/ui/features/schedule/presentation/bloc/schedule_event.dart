part of 'schedule_bloc.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class ScheduleRequested extends ScheduleEvent {}

class ScheduleSaved extends ScheduleEvent {
  const ScheduleSaved({
    required this.schedule,
  });

  final ScheduleModel schedule;
}
