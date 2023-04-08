import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppAuthenticated>(_onAuhtenticated);
  }

  void _onAuhtenticated(
    AppAuthenticated event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        status: AppStatus.authenticated,
        user: event.user,
      ),
    );
  }
}
