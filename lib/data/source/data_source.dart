
import 'package:sqflite/sqflite.dart';
import 'package:taskapp/data/model/category_model.dart';
import '../../database/app_database.dart';

// talks directly to the database.
class DataSource {
  // holds an instance of  AppDatabase.
  final AppDatabase database;
  DataSource(this.database);
  // called by RepositoryImpl.
  Future<void> addCategory(CategoryModel category) async {
    // Get the database
    final db = await database.db;

    // Insert
    await db.insert(
      CategoryModel.tableName,
      {'title': category.title, 'dateTime': category.dateTime},
      conflictAlgorithm: ConflictAlgorithm.replace,
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

  Future<void> deleteCategory({required String id}) async {
    try {
      final db = await AppDatabase.instance.db;
      final count = await db.delete(
        CategoryModel.tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) {
        print('Warning: Category with id $id not found for deletion.');
      }
    } catch (e) {
      throw Exception('Failed to delete category: $e');
    }
  }

}
