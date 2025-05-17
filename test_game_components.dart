import 'lib/board.dart';
import 'lib/player.dart';

void main() {
  print('Testing Tic-Tac-Toe components\n');
  
  // Test the Board class
  print('=== Testing Board ===');
  Board board = Board();
  print('Initial board:');
  print(board);
  
  // Test making valid moves
  print('\nMaking moves:');
  print('Place X at position i: ${board.makeMove(1, 'X')}');
  print('Place O at position 5: ${board.makeMove(5, 'O')}');
  print('Place X at position 9: ${board.makeMove(9, 'X')}');
  print(board);
  
  // Test invalid move (already taken position)
  print('\nTrying to place O at position 1 (already taken):');
  print('Result: ${board.makeMove(1, 'O')}');
  print(board);
  
  // Test win detection
  print('\n=== Testing Win Detection ===');
  Board winBoard = Board();
  winBoard.makeMove(1, 'X'); // top row
  winBoard.makeMove(2, 'X');
  winBoard.makeMove(3, 'X');
  print('Board with winning horizontal row:');
  print(winBoard);
  print('Winner: ${winBoard.checkWinner()}');
  
  Board winBoard2 = Board();
  winBoard2.makeMove(1, 'O'); // first column
  winBoard2.makeMove(4, 'O');
  winBoard2.makeMove(7, 'O');
  print('\nBoard with winning vertical column:');
  print(winBoard2);
  print('Winner: ${winBoard2.checkWinner()}');
  
  Board winBoard3 = Board();
  winBoard3.makeMove(1, 'X'); // diagonal
  winBoard3.makeMove(5, 'X');
  winBoard3.makeMove(9, 'X');
  print('\nBoard with winning diagonal:');
  print(winBoard3);
  print('Winner: ${winBoard3.checkWinner()}');
  
  // Test draw detection
  print('\n=== Testing Draw Detection ===');
  Board drawBoard = Board();
  // Fill the board without any winner
  drawBoard.makeMove(1, 'X');
  drawBoard.makeMove(2, 'O');
  drawBoard.makeMove(3, 'X');
  drawBoard.makeMove(4, 'O');
  drawBoard.makeMove(5, 'X');
  drawBoard.makeMove(6, 'O');
  drawBoard.makeMove(7, 'O');
  drawBoard.makeMove(8, 'X');
  drawBoard.makeMove(9, 'O');
  print('Board with all positions filled (draw):');
  print(drawBoard);
  print('Winner: ${drawBoard.checkWinner()}');
  print('Is board full: ${drawBoard.isFull()}');
  
  // Test Player class
  print('\n=== Testing Player ===');
  Player player1 = Player('Player 1', 'X');
  Player player2 = Player('Player 2', 'O');
  print('Player 1: ${player1}');
  print('Player 2: ${player2}');
}