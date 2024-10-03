import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('ecommerce_db');
    return _database!;
  }

  Future<Database> _initDB(String filepatth) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepatth);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE USERS (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT  NULL
      )''');

    await db.execute('''
      CREATE TABLE PRODUCT (
      id PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      description TEXT,
      imageUrl TEXT NOT NULL,
      price REAL NOT NULL
        ) ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
