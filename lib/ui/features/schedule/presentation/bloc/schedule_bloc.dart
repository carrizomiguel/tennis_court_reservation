import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc({
    required this.repository,
  }) : super(const ScheduleState()) {
    on<ScheduleRequested>(_onRequested);
    on<ScheduleSaved>(_onSaved);
  }

  final ScheduleRepository repository;

  Future<void> _onRequested(
    ScheduleRequested event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ScheduleStatus.loading,
      ),
    );
    final result = await repository.getSchedule();
    result.when(
      ok: (schedule) {
        emit(
          state.copyWith(
            status: schedule.isEmpty
                ? ScheduleStatus.empty
                : ScheduleStatus.success,
            schedule: schedule,
          ),
        );
      },
      err: (failure) {
        emit(
          state.copyWith(
            status: ScheduleStatus.error,
          ),
        );
      },
    );
  }

  Future<void> _onSaved(
    ScheduleSaved event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ScheduleStatus.loading,
      ),
    );
    final result = await repository.saveSchedule(
      event.schedule,
    );
    result.when(
      ok: (_) {
        add(ScheduleRequested());
      },
      err: (failure) {
        emit(
          state.copyWith(
            status: ScheduleStatus.error,
          ),
        );
      },
    );
  }
}
