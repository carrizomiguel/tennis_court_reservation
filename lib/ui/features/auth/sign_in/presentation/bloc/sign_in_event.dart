part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInSubmitted extends SignInEvent {
  const SignInSubmitted({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
