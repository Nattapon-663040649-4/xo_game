import 'dart:math';
import '../models/game_state.dart';

class AIPlayer {
  final Random random = Random();

  int getBestMove(GameState game) {
    List<int> available = game.getAvailableMoves();
    if (available.isEmpty) return -1;

    return _getStrategicMove(game, available);
  }

  int _getStrategicMove(GameState game, List<int> available) {
    // 1. Check if AI can win
    for (int move in available) {
      GameState testGame = game.clone();
      testGame.makeMove(move);
      if (testGame.winner == 'O') return move;
    }

    // 2. Block player from winning
    for (int move in available) {
      GameState testGame = game.clone();
      testGame.currentPlayer = 'X';
      testGame.makeMove(move);
      if (testGame.winner == 'X') return move;
    }

    // 3. Take center if available
    int center = (game.gridSize * game.gridSize) ~/ 2;
    if (available.contains(center)) return center;

    // 4. Take corner
    List<int> corners = [
      0,
      game.gridSize - 1,
      game.gridSize * (game.gridSize - 1),
      game.gridSize * game.gridSize - 1,
    ];

    List<int> availableCorners = corners
        .where((c) => available.contains(c))
        .toList();
    if (availableCorners.isNotEmpty) {
      return availableCorners[random.nextInt(availableCorners.length)];
    }

    // 5. Take any available move
    return available[random.nextInt(available.length)];
  }
}
