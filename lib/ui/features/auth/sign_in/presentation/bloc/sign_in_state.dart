part of 'sign_in_bloc.dart';

enum SignInStatus {
  initial,
  loading,
  success,
  error,
}

class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.initial,
    this.user = const UserModel.empty(),
  });

  final SignInStatus status;
  final UserModel user;

  SignInState copyWith({
    SignInStatus? status,
    UserModel? user,
  }) {
    return SignInState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status];
}
