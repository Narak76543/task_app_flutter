import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskapp/data/model/category_model.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();
  static Database? _database;

  Future<Database> get db async => _database ??= await _init();

  Future<Database> _init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    // Use path.join to ensure a correct path separator
    String path = p.join(directory.path, 'task_app.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        // helpful for debugging
        print('Database opened at: $path');
      },
      onCreate: (db, version) async {
        await _onCreateTable(db.batch());
      },
      onUpgrade: (db, oldVersion, newVersion) {},
    );
  }

  Future<void> _onCreateTable(Batch batch) async {
    batch.execute(
      // correct triple-quoted SQL string, no extra quote
      '''CREATE TABLE ${CategoryModel.tableName}(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          dateTime TEXT
        )''',
    );
    await batch.commit();
  }
}

