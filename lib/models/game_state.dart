class GameState {
  final int gridSize;
  List<String> board;
  String currentPlayer;
  List<String> moves;
  String? winner;
  bool isGameOver;

  GameState({required this.gridSize, this.currentPlayer = 'X'})
    : board = List.filled(gridSize * gridSize, ''),
      moves = [],
      winner = null,
      isGameOver = false;

  void makeMove(int index) {
    if (board[index].isEmpty && !isGameOver) {
      board[index] = currentPlayer;
      moves.add('$currentPlayer:$index');

      if (checkWinner()) {
        winner = currentPlayer;
        isGameOver = true;
      } else if (board.every((cell) => cell.isNotEmpty)) {
        winner = 'Draw';
        isGameOver = true;
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    }
  }

  bool checkWinner() {
    // Check rows
    for (int i = 0; i < gridSize; i++) {
      bool rowWin = true;
      for (int j = 0; j < gridSize; j++) {
        if (board[i * gridSize + j] != currentPlayer) {
          rowWin = false;
          break;
        }
      }
      if (rowWin) return true;
    }

    // Check columns
    for (int i = 0; i < gridSize; i++) {
      bool colWin = true;
      for (int j = 0; j < gridSize; j++) {
        if (board[j * gridSize + i] != currentPlayer) {
          colWin = false;
          break;
        }
      }
      if (colWin) return true;
    }

    // Check diagonal (top-left to bottom-right)
    bool diag1Win = true;
    for (int i = 0; i < gridSize; i++) {
      if (board[i * gridSize + i] != currentPlayer) {
        diag1Win = false;
        break;
      }
    }
    if (diag1Win) return true;

    // Check diagonal (top-right to bottom-left)
    bool diag2Win = true;
    for (int i = 0; i < gridSize; i++) {
      if (board[i * gridSize + (gridSize - 1 - i)] != currentPlayer) {
        diag2Win = false;
        break;
      }
    }
    return diag2Win;
  }

  List<int> getAvailableMoves() {
    List<int> available = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        available.add(i);
      }
    }
    return available;
  }

  GameState clone() {
    GameState cloned = GameState(gridSize: gridSize);
    cloned.board = List.from(board);
    cloned.currentPlayer = currentPlayer;
    cloned.isGameOver = isGameOver;
    cloned.winner = winner;
    cloned.moves = List.from(moves);
    return cloned;
  }
}
