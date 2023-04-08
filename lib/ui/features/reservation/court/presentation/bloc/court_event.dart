part of 'court_bloc.dart';

abstract class CourtEvent extends Equatable {
  const CourtEvent();

  @override
  List<Object> get props => [];
}

class CourtRequested extends CourtEvent {}
