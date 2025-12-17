import 'package:flutter/material.dart';
import 'game_screen.dart';

class GameSetupScreen extends StatefulWidget {
  final bool isAI;

  const GameSetupScreen({super.key, required this.isAI});

  @override
  State<GameSetupScreen> createState() => _GameSetupScreenState();
}

class _GameSetupScreenState extends State<GameSetupScreen> {
  final TextEditingController _controller = TextEditingController(text: '3');
  String? errorMessage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAI ? 'vs Bot Setup' : '2 Player Setup'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter Grid Size',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    suffix: const Text('x', style: TextStyle(fontSize: 48)),
                    border: const OutlineInputBorder(),
                    errorText: errorMessage,
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  onChanged: (value) {
                    setState(() {
                      errorMessage = null;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Recommended: 3-10',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _startGame,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Start Game', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startGame() {
    final input = _controller.text.trim();

    if (input.isEmpty) {
      setState(() {
        errorMessage = 'Please enter a number';
      });
      return;
    }

    final gridSize = int.tryParse(input);

    if (gridSize == null) {
      setState(() {
        errorMessage = 'Invalid number';
      });
      return;
    }

    if (gridSize < 3) {
      setState(() {
        errorMessage = 'Minimum is 3';
      });
      return;
    }

    if (gridSize > 20) {
      setState(() {
        errorMessage = 'Maximum is 20';
      });
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(gridSize: gridSize, isAI: widget.isAI),
      ),
    );
  }
}
