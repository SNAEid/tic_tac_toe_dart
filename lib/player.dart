/// Represents a player in the Tic-Tac-Toe game.
class Player {
  /// The name of the player.
  final String name;
  
  /// The marker used by the player ('X' or 'O').
  final String marker;

  /// Creates a new player with the specified name and marker.
  ///
  /// [name] - The name of the player.
  /// [marker] - The marker used by the player ('X' or 'O').
  Player(this.name, this.marker);

  /// Returns a string representation of the player.
  @override
  String toString() {
    return '$name ($marker)';
  }
}
