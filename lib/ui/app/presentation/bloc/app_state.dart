part of 'app_bloc.dart';

enum AppStatus {
  unauthenticated,
  authenticated,
}

class AppState extends Equatable {
  const AppState({
    this.status = AppStatus.unauthenticated,
    this.user = const UserModel.empty(),
  });

  final AppStatus status;
  final UserModel user;

  AppState copyWith({
    AppStatus? status,
    UserModel? user,
  }) {
    return AppState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, user];
}
