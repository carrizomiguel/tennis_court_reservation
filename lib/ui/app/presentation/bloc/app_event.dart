part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppAuthenticated extends AppEvent {
  const AppAuthenticated({
    required this.user,
  });

  final UserModel user;
}
