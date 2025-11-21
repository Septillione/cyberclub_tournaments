part of 'bracket_bloc.dart';

abstract class BracketState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BracketLoading extends BracketState {}

class BracketLoaded extends BracketState {
  final List<List<BracketMatch>> rounds;

  BracketLoaded(this.rounds);

  @override
  List<Object?> get props => [rounds];
}
