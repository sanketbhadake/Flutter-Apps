// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DBHelper {
//   static Database? _database;

//   // Open or create the database
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }

//   // Initialize the database
//   Future<Database> _initDB() async {
//     String path = join(await getDatabasesPath(), 'favorites.db');
//     return await openDatabase(path, version: 1, onCreate: (db, version) {
//       return db.execute('''
//       CREATE TABLE favorites(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT,
//         image TEXT,
//         price TEXT
//       )
//       ''');
//     });
//   }

//   // Add a favorite item to the local database
//   Future<void> addFavorite(Map<String, dynamic> favorite) async {
//     final db = await database;
//     await db.insert('favorites', favorite);
//   }

//   // Get all favorite items from the local database
//   Future<List<Map<String, dynamic>>> getFavorites() async {
//     final db = await database;
//     return await db.query('favorites');
//   }
// }
import 'package:project/favourite_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  // Open or create the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorite_cookies.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE favorites(id INTEGER PRIMARY KEY, name TEXT, price TEXT, imageUrl TEXT)',
      );
    });
  }

  // Add a favorite to the SQLite database
  Future<void> addFavorite(FavoriteCookie cookie) async {
    final db = await database;
    await db.insert(
      'favorites',
      cookie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Fetch all favorites from SQLite
  Future<List<FavoriteCookie>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return List.generate(maps.length, (i) {
      return FavoriteCookie(
        name: maps[i]['name'],
        price: maps[i]['price'],
        imageUrl: maps[i]['imageUrl'],
      );
    });
  }
}
