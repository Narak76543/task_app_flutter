import 'package:taskapp/data/model/category_model.dart';

abstract class LocalData {
  Future<void> addCategory({required String title, required String dateTime});
  Future<List<CategoryModel>> getAllCategory();
  Future<void> deleteCategory( {required String id});
}


