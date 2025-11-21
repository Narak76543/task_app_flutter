import 'package:taskapp/data/model/category_model.dart';

abstract class Repository {
  Future<void> addCategory ( CategoryModel category);
  Future<List<CategoryModel>> getAllCategory ();
  Future<void> deleteCategory( {required String id});
}