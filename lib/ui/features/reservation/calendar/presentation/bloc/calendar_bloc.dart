import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(const CalendarState()) {
    on<CalendarInitialized>(_onInitialized);
    on<CalendarDateChanged>(_onDateChanged);
    on<CalendarCourtSelected>(_onCourtSelected);
    on<CalendarHourSelected>(_onHourSelected);
  }

  void _onInitialized(
    CalendarInitialized event,
    Emitter<CalendarState> emit,
  ) {
    final today = DateTime.now();
    if (today.hour > 17) {
      final tomorrow = today.add(
        const Duration(days: 1),
      );
      emit(
        state.copyWith(
          status: CalendarStatus.success,
          schedule: state.schedule.copyWith(
            date: DateTime(
              tomorrow.year,
              tomorrow.month,
              tomorrow.day,
              8,
            ),
          ),
        ),
      );
    } else {
      final hour = _findClosestValue(today.hour, ScheduleModel.hours);
      emit(
        state.copyWith(
          status: CalendarStatus.success,
          schedule: state.schedule.copyWith(
            date: DateTime(
              today.year,
              today.month,
              today.day,
              hour,
            ),
          ),
        ),
      );
    }
  }

  void _onDateChanged(
    CalendarDateChanged event,
    Emitter<CalendarState> emit,
  ) {
    final today = DateTime.now();
    final date = event.date;
    emit(
      state.copyWith(
        schedule: state.schedule.copyWith(
          date: DateTime(
            date.year,
            date.month,
            date.day,
            today.day == date.day
                ? _findClosestValue(
                    today.hour,
                    ScheduleModel.hours,
                  )
                : 8,
          ),
        ),
      ),
    );
  }

  void _onCourtSelected(
    CalendarCourtSelected event,
    Emitter<CalendarState> emit,
  ) {
    emit(
      state.copyWith(
        schedule: state.schedule.copyWith(
          court: event.court,
        ),
      ),
    );
  }

  void _onHourSelected(
    CalendarHourSelected event,
    Emitter<CalendarState> emit,
  ) {
    final currentDate = state.schedule.date!;
    emit(
      state.copyWith(
        schedule: state.schedule.copyWith(
          date: DateTime(
            currentDate.year,
            currentDate.month,
            currentDate.day,
            event.hour,
          ),
        ),
      ),
    );
  }

  int _findClosestValue(int input, List<int> values) {
    if (input.isOdd) {
      final index = values.indexOf(input + 1);
      return values[index];
    } else {
      final index = values.indexOf(input);
      return values[index + 1];
    }
  }
}
