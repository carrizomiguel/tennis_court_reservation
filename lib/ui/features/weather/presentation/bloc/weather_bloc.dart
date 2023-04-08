import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.repository,
  }) : super(const WeatherState()) {
    on<WeatherRequested>(_onRequested);
  }

  final WeatherRepository repository;

  Future<void> _onRequested(
    WeatherRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(
      state.copyWith(
        status: WeatherStatus.loading,
      ),
    );
    final result = await repository.getWeather();
    result.when(
      ok: (weather) {
        emit(
          state.copyWith(
            status: WeatherStatus.success,
            weather: weather,
          ),
        );
      },
      err: (failure) {
        emit(
          state.copyWith(
            status: WeatherStatus.error,
          ),
        );
      },
    );
  }
}
