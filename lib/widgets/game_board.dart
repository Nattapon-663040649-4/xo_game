import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final int gridSize;
  final List<String> board;
  final Function(int) onTap;

  const GameBoard({
    super.key,
    required this.gridSize,
    required this.board,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridSize,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: gridSize * gridSize,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  board[index],
                  style: TextStyle(
                    fontSize: 60 / gridSize * 3,
                    fontWeight: FontWeight.bold,
                    color: board[index] == 'X' ? Colors.blue : Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
