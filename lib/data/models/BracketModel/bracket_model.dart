class BracketParticipant {
  final String id;
  final String name;
  final String? avatarUrl;

  BracketParticipant(this.id, this.name, {this.avatarUrl});
}

class BracketMatch {
  final BracketParticipant? player1;
  final BracketParticipant? player2;
  int score1;
  int score2;

  BracketMatch({this.player1, this.player2, this.score1 = 0, this.score2 = 0});

  BracketMatch copyWith({
    BracketParticipant? player1,
    BracketParticipant? player2,
    int? score1,
    int? score2,
  }) {
    return BracketMatch(
      player1: player1 ?? this.player1,
      player2: player2 ?? this.player2,
      score1: score1 ?? this.score1,
      score2: score2 ?? this.score2,
    );
  }
}
