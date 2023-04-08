import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required this.repository,
  }) : super(const SignInState()) {
    on<SignInSubmitted>(_onSubmitted);
  }

  final SignInRepository repository;

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SignInStatus.loading,
      ),
    );
    final result = await repository.signIn(
      event.email,
      event.password,
    );
    result.when(
      ok: (user) {
        emit(
          state.copyWith(
            status: SignInStatus.success,
            user: user,
          ),
        );
      },
      err: (failure) {
        emit(
          state.copyWith(
            status: SignInStatus.error,
          ),
        );
      },
    );
  }
}
