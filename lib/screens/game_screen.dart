import 'package:flutter/material.dart';
import '../models/game_state.dart';
import '../services/ai_player.dart';
import '../services/database_helper.dart';
import '../widgets/game_board.dart';

class GameScreen extends StatefulWidget {
  final int gridSize;
  final bool isAI;

  const GameScreen({super.key, required this.gridSize, required this.isAI});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameState game;
  late AIPlayer ai;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    game = GameState(gridSize: widget.gridSize);
    ai = AIPlayer();
  }

  void handleTap(int index) {
    if (isProcessing || game.board[index].isNotEmpty || game.isGameOver) {
      return;
    }

    setState(() {
      game.makeMove(index);
    });

    if (game.isGameOver) {
      _handleGameOver();
      return;
    }

    if (widget.isAI && game.currentPlayer == 'O') {
      _makeAIMove();
    }
  }

  Future<void> _makeAIMove() async {
    setState(() => isProcessing = true);

    await Future.delayed(const Duration(milliseconds: 500));

    int aiMove = ai.getBestMove(game);
    if (aiMove != -1) {
      setState(() {
        game.makeMove(aiMove);
        isProcessing = false;
      });

      if (game.isGameOver) {
        _handleGameOver();
      }
    }
  }

  Future<void> _handleGameOver() async {
    await _saveGame();
    if (mounted) {
      _showGameOverDialog();
    }
  }

  Future<void> _saveGame() async {
    await DatabaseHelper.insertGame({
      'gridSize': game.gridSize,
      'moves': game.moves.join(','),
      'winner': game.winner ?? 'Draw',
      'gameMode': widget.isAI ? 'vs Bot' : '2 Players',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Game Over'),
        content: Text(
          game.winner == 'Draw' ? 'It\'s a Draw' : 'Player ${game.winner} Wins',
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Main Menu'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                game = GameState(gridSize: widget.gridSize);
                isProcessing = false;
              });
            },
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.gridSize}x${widget.gridSize} XO Game'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Turn: ${game.currentPlayer}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GameBoard(
            gridSize: widget.gridSize,
            board: game.board,
            onTap: handleTap,
          ),
        ),
      ),
    );
  }
}
