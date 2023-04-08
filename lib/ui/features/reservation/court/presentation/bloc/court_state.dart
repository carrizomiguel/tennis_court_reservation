part of 'court_bloc.dart';

enum CourtStatus {
  loading,
  success,
  error,
}

class CourtState extends Equatable {
  const CourtState({
    this.status = CourtStatus.loading,
    this.courts = const [],
  });

  final CourtStatus status;
  final List<CourtModel> courts;

  CourtState copyWith({
    CourtStatus? status,
    List<CourtModel>? courts,
  }) {
    return CourtState(
      status: status ?? this.status,
      courts: courts ?? this.courts,
    );
  }

  @override
  List<Object?> get props => [status, courts];
}
