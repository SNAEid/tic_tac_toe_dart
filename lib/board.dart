/// Represents a Tic-Tac-Toe board and provides methods to interact with it.
class Board {
  /// The current state of the board, represented as a list of strings.
  /// Initially, all cells are empty (represented by spaces).
  List<String> cells = List.filled(9, ' ');

  /// Resets the board to its initial state (all cells empty).
  void reset() {
    cells = List.filled(9, ' ');
  }

  /// Places a marker ('X' or 'O') at the specified position on the board.
  ///
  /// [position] - The position (1-9) where the marker should be placed.
  /// [marker] - The marker ('X' or 'O') to place.
  ///
  /// Returns true if the move was successful, false otherwise.
  bool makeMove(int position, String marker) {
    // Adjust position to 0-based index
    int index = position - 1;
    
    // Check if the position is valid and empty
    if (index < 0 || index >= cells.length || cells[index] != ' ') {
      return false;
    }
    
    cells[index] = marker;
    return true;
  }

  /// Checks if the board is full (all cells filled with markers).
  ///
  /// Returns true if the board is full, false otherwise.
  bool isFull() {
    return !cells.contains(' ');
  }

  /// Checks if there is a winner on the board.
  ///
  /// Returns the marker ('X' or 'O') of the winner, or null if there is no winner.
  String? checkWinner() {
    // Define winning combinations (rows, columns, diagonals)
    final winningCombinations = [
      // Rows
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      // Columns
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      // Diagonals
      [0, 4, 8],
      [2, 4, 6]
    ];

    // Check each winning combination
    for (var combination in winningCombinations) {
      if (cells[combination[0]] != ' ' &&
          cells[combination[0]] == cells[combination[1]] &&
          cells[combination[0]] == cells[combination[2]]) {
        return cells[combination[0]];
      }
    }

    // No winner found
    return null;
  }

  /// Returns a string representation of the board for display.
  ///
  /// The string includes the current state of the board with row and column dividers.
  @override
  String toString() {
    // Helper function to show cell content or position
    String cellContent(int index) {
      if (cells[index] == ' ') {
        return (index + 1).toString();
      }
      return cells[index];
    }

    return '''
 ${cellContent(0)} | ${cellContent(1)} | ${cellContent(2)} 
---+---+---
 ${cellContent(3)} | ${cellContent(4)} | ${cellContent(5)} 
---+---+---
 ${cellContent(6)} | ${cellContent(7)} | ${cellContent(8)} 
''';
  }
}
