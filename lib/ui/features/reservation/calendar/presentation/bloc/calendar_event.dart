part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class CalendarInitialized extends CalendarEvent {}

class CalendarDateChanged extends CalendarEvent {
  const CalendarDateChanged({
    required this.date,
  });

  final DateTime date;
}

class CalendarCourtSelected extends CalendarEvent {
  const CalendarCourtSelected({
    required this.court,
  });

  final CourtModel court;
}

class CalendarHourSelected extends CalendarEvent {
  const CalendarHourSelected({
    required this.hour,
  });

  final int hour;
}
