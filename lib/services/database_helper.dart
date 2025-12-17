import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'xo_game.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE games(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            gridSize INTEGER,
            moves TEXT,
            winner TEXT,
            gameMode TEXT,
            timestamp TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertGame(Map<String, dynamic> game) async {
    final db = await database;
    return await db.insert('games', game);
  }

  static Future<List<Map<String, dynamic>>> getGames() async {
    final db = await database;
    return await db.query('games', orderBy: 'timestamp DESC');
  }

  static Future<int> deleteGame(int id) async {
    final db = await database;
    return await db.delete('games', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> clearAllGames() async {
    final db = await database;
    await db.delete('games');
  }
}
