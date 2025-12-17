import 'package:flutter/material.dart';
import 'game_setup_screen.dart';
import 'history_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('XO Game'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.grid_on, size: 100, color: Colors.blue),
            const SizedBox(height: 40),
            _MenuButton(
              icon: Icons.people,
              label: '2 Players',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameSetupScreen(isAI: false),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _MenuButton(
              icon: Icons.smart_toy,
              label: 'vs AI',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameSetupScreen(isAI: true),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _MenuButton(
              icon: Icons.history,
              label: 'Game History',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _MenuButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
    );
  }
}
