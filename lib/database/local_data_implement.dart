import 'package:sqflite/sqflite.dart';
import 'package:taskapp/data/model/category_model.dart';
import 'package:taskapp/database/app_database.dart';
import 'package:taskapp/database/local_data.dart';

class LocalDataImplement extends LocalData {
  @override
  Future<void> addCategory({required String title, required String dateTime}) async {
    try {
      final db = await AppDatabase.instance.db;
      await db.insert(
        CategoryModel.tableName,
        {
          'title': title,
          'dateTime': dateTime,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('failed to add Category : $e');
    }
  }
}
