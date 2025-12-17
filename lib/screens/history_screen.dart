import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import 'replay_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> games = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGames();
  }

  Future<void> _loadGames() async {
    setState(() => isLoading = true);
    final data = await DatabaseHelper.getGames();
    setState(() {
      games = data;
      isLoading = false;
    });
  }

  Future<void> _deleteGame(int id) async {
    await DatabaseHelper.deleteGame(id);
    _loadGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game History')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : games.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No games played yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                return _GameHistoryCard(
                  game: games[index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReplayScreen(game: games[index]),
                    ),
                  ),
                  onDelete: () => _deleteGame(games[index]['id']),
                );
              },
            ),
    );
  }
}

class _GameHistoryCard extends StatelessWidget {
  final Map<String, dynamic> game;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _GameHistoryCard({
    required this.game,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final timestamp = DateTime.parse(game['timestamp']);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            '${game['gridSize']}x',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          'Winner: ${game['winner']}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Mode: ${game['gameMode']}\n'
          '${timestamp.day}/${timestamp.month}/${timestamp.year} '
          '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}',
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: onTap,
              tooltip: 'Replay',
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}
