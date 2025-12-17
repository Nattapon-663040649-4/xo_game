import 'package:flutter/material.dart';
import '../widgets/game_board.dart';

class ReplayScreen extends StatefulWidget {
  final Map<String, dynamic> game;

  const ReplayScreen({super.key, required this.game});

  @override
  State<ReplayScreen> createState() => _ReplayScreenState();
}

class _ReplayScreenState extends State<ReplayScreen> {
  late List<String> moves;
  late List<String> board;
  int currentMove = 0;
  late int gridSize;
  bool isAutoPlaying = false;

  @override
  void initState() {
    super.initState();
    gridSize = widget.game['gridSize'];
    moves = widget.game['moves'].split(',');
    board = List.filled(gridSize * gridSize, '');
  }

  void _nextMove() {
    if (currentMove < moves.length) {
      final move = moves[currentMove].split(':');
      final player = move[0];
      final position = int.parse(move[1]);
      setState(() {
        board[position] = player;
        currentMove++;
      });
    } else {
      _stopAutoPlay();
    }
  }

  void _previousMove() {
    if (currentMove > 0) {
      final move = moves[currentMove - 1].split(':');
      final position = int.parse(move[1]);
      setState(() {
        board[position] = '';
        currentMove--;
      });
    }
  }

  void _reset() {
    setState(() {
      board = List.filled(gridSize * gridSize, '');
      currentMove = 0;
    });
    _stopAutoPlay();
  }

  void _toggleAutoPlay() {
    setState(() {
      isAutoPlaying = !isAutoPlaying;
    });

    if (isAutoPlaying) {
      _autoPlayNext();
    }
  }

  void _autoPlayNext() {
    if (isAutoPlaying && currentMove < moves.length) {
      _nextMove();
      Future.delayed(const Duration(milliseconds: 800), _autoPlayNext);
    } else {
      _stopAutoPlay();
    }
  }

  void _stopAutoPlay() {
    setState(() {
      isAutoPlaying = false;
    });
  }

  @override
  void dispose() {
    _stopAutoPlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Replay Game')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GameBoard(
                  gridSize: gridSize,
                  board: board,
                  onTap: (_) {}, // Disabled in replay
                ),
              ),
            ),
          ),
          _ReplayControls(
            currentMove: currentMove,
            totalMoves: moves.length,
            isAutoPlaying: isAutoPlaying,
            canGoBack: currentMove > 0,
            canGoForward: currentMove < moves.length,
            onPrevious: _previousMove,
            onReset: _reset,
            onNext: _nextMove,
            onAutoPlay: _toggleAutoPlay,
          ),
        ],
      ),
    );
  }
}

class _ReplayControls extends StatelessWidget {
  final int currentMove;
  final int totalMoves;
  final bool isAutoPlaying;
  final bool canGoBack;
  final bool canGoForward;
  final VoidCallback onPrevious;
  final VoidCallback onReset;
  final VoidCallback onNext;
  final VoidCallback onAutoPlay;

  const _ReplayControls({
    required this.currentMove,
    required this.totalMoves,
    required this.isAutoPlaying,
    required this.canGoBack,
    required this.canGoForward,
    required this.onPrevious,
    required this.onReset,
    required this.onNext,
    required this.onAutoPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Text(
            'Move $currentMove / $totalMoves',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: canGoBack ? onPrevious : null,
                icon: const Icon(Icons.skip_previous),
                iconSize: 32,
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: onReset,
                icon: const Icon(Icons.replay),
                iconSize: 32,
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: onAutoPlay,
                icon: Icon(isAutoPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 32,
                style: IconButton.styleFrom(
                  backgroundColor: isAutoPlaying ? Colors.orange : null,
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: canGoForward ? onNext : null,
                icon: const Icon(Icons.skip_next),
                iconSize: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
