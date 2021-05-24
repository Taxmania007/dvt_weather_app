import "dart:io" as io;

import "package:path/path.dart";
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDB {
  static final SQLiteDB _instance = new SQLiteDB.internal();

  factory SQLiteDB() => _instance;
  static late Database _db;

  Future<Database> get db async {
    _db = await initDb();
    return _db;
  }

  SQLiteDB.internal();

  /// Initialize DB
  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "dvt_weather.db");
    var taskDb = await openDatabase(path, version: 1);
    taskDb.execute("""
      CREATE TABLE IF NOT EXISTS FavCities(
       id INTEGER PRIMARY KEY,
       wikiDataId TEXT,
    type TEXT,
    city TEXT,
    name TEXT,
    country TEXT,
    countryCode TEXT,
    region TEXT,
    regionCode TEXT,
    latitude REAL,
    longitude REAL,
    population INTEGER
      )""");
    return taskDb;
  }
}
