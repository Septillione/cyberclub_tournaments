part of 'bracket_bloc.dart';

abstract class BracketEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BracketStarted extends BracketEvent {}

class BracketMatchUpdated extends BracketEvent {
  final int roundIndex;
  final int matchIndex;

  BracketMatchUpdated(this.roundIndex, this.matchIndex);
}
