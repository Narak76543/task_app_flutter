// lib/data/source/data_source.dart

import 'package:sqflite/sqflite.dart';
import 'package:taskapp/data/model/category_model.dart';
import '../../database/app_database.dart'; // This line points to your AppDatabase

// This class is the ONLY one that talks directly to the database.
class DataSource {
  // It holds an instance of your AppDatabase.
  final AppDatabase database;

  // It requires the database to be provided when it's created.
  DataSource(this.database);

  // This method will be called by your RepositoryImpl.
  Future<void> addCategory(CategoryModel category) async {
    // Get the database instance
    final db = await database.db;

    // Insert the category into the database
    await db.insert(
      CategoryModel.tableName, // Use the table name from the model
      {'title': category.title, 'dateTime': category.dateTime},
      conflictAlgorithm: ConflictAlgorithm.replace, // Handle conflicts
    );
  }

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final db = await AppDatabase.instance.db;
      final result = await db.query(CategoryModel.tableName);
      return result.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('failed to add Category : $e');
    }
  }

  // You would add other methods here, for example:
  // Future<List<CategoryModel>> getAllCategories() async {
  //   final dao = database.categoryDao;
  //   return await dao.getAllCategories();
  // }
}
