import 'dart:async';

import 'package:course/data-layer/models/response_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblCache = 'cache';
  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/news.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblCache (
        title TEXT,
        description TEXT
      );
    ''');
  }

  Future<void> insertCache({required ArticlesResponse articles}) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final article in articles.articles!) {
        final data = article.toJson();
        txn.insert(
          _tblCache,
          data,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCache() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(
      _tblCache,
    );
    return results;
  }

  Future<int> clearCache(String category) async {
    final db = await database;
    return await db!.delete(
      _tblCache,
    );
  }
}
