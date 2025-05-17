import 'dart:io';
import 'board.dart';
import 'player.dart';

/// Manages the game state and logic for Tic-Tac-Toe.
class Game {
  /// The Tic-Tac-Toe board used for the game.
  final Board board = Board();
  
  /// The first player (using 'X' marker).
  final Player player1 = Player('Player 1', 'X');
  
  /// The second player (using 'O' marker).
  final Player player2 = Player('Player 2', 'O');
  
  /// The player whose turn it currently is.
  late Player currentPlayer;

  /// Creates a new Tic-Tac-Toe game and initializes it.
  Game() {
    currentPlayer = player1;
  }

  /// Starts the game loop, handling player moves until the game ends.
  void start() {
    bool playAgain = true;

    while (playAgain) {
      // Reset the game state
      board.reset();
      currentPlayer = player1;
      
      // Display game instructions
      _displayInstructions();
      
      // Game loop
      bool gameOver = false;
      while (!gameOver) {
        // Display the current board
        print(board);
        
        // Get and process the current player's move
        _processTurn();
        
        // Check for game-ending conditions
        String? winner = board.checkWinner();
        if (winner != null) {
          // We have a winner
          print(board);
          Player winningPlayer = winner == player1.marker ? player1 : player2;
          print('Congratulations! ${winningPlayer.name} wins!');
          gameOver = true;
        } else if (board.isFull()) {
          // Game is a draw
          print(board);
          print("It's a draw!");
          gameOver = true;
        } else {
          // Switch to the other player
          _switchPlayer();
        }
      }
      
      // Ask if players want to play again
      playAgain = _askToPlayAgain();
    }
    
    print('Thanks for playing!');
  }

  /// Processes a single turn for the current player.
  void _processTurn() {
    bool validMove = false;
    
    while (!validMove) {
      // Prompt the current player for their move
      stdout.write('${currentPlayer.name}, enter your move (1-9): ');
      String? input = stdin.readLineSync();
      
      if (input == null || input.isEmpty) {
        print('Invalid input. Please try again.');
        continue;
      }
      
      int? position;
      try {
        position = int.parse(input);
      } catch (e) {
        print('Invalid input. Please enter a number between 1 and 9.');
        continue;
      }
      
      if (position < 1 || position > 9) {
        print('Invalid position. Please enter a number between 1 and 9.');
        continue;
      }
      
      // Try to make the move
      validMove = board.makeMove(position, currentPlayer.marker);
      if (!validMove) {
        print('That position is already taken. Please choose another.');
      }
    }
  }

  /// Switches the current player to the other player.
  void _switchPlayer() {
    currentPlayer = (currentPlayer == player1) ? player2 : player1;
  }

  /// Asks if the players want to play again.
  ///
  /// Returns true if they want to play again, false otherwise.
  bool _askToPlayAgain() {
    while (true) {
      stdout.write('Do you want to play again? (y/n): ');
      String? input = stdin.readLineSync()?.toLowerCase();
      
      if (input == 'y' || input == 'yes') {
        return true;
      } else if (input == 'n' || input == 'no') {
        return false;
      } else {
        print('Invalid input. Please enter y/n.');
      }
    }
  }

  /// Displays the game instructions.
  void _displayInstructions() {
    print('''
=== TIC-TAC-TOE ===
Welcome to Tic-Tac-Toe!

Instructions:
- Player 1 uses 'X' and Player 2 uses 'O'
- Players take turns to place their marker on the board
- Enter a number from 1-9 to place your marker in the corresponding position
- The first player to get three markers in a row (horizontally, vertically, or diagonally) wins
- If all positions are filled and no player has won, the game is a draw

Let's begin!
''');
  }
}
