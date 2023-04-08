import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';

part 'court_event.dart';
part 'court_state.dart';

class CourtBloc extends Bloc<CourtEvent, CourtState> {
  CourtBloc({
    required this.repository,
  }) : super(const CourtState()) {
    on<CourtRequested>(_onRequested);
  }

  final CourtRepository repository;

  Future<void> _onRequested(
    CourtRequested event,
    Emitter<CourtState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CourtStatus.loading,
      ),
    );
    final result = await repository.getCourts();
    result.when(
      ok: (courts) {
        emit(
          state.copyWith(
            status: CourtStatus.success,
            courts: courts,
          ),
        );
      },
      err: (failure) {
        emit(
          state.copyWith(
            status: CourtStatus.error,
          ),
        );
      },
    );
  }
}
