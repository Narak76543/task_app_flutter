import 'package:taskapp/data/model/category_model.dart';
import 'package:taskapp/data/repo/repository.dart';
import 'package:taskapp/data/source/data_source.dart';

class RepositoryImpl implements Repository {
  final DataSource _dataSource;

  RepositoryImpl(this._dataSource);

  @override
  Future<void> addCategory(CategoryModel category) {
    return _dataSource.addCategory(category);
  }

  @override
  Future<List<CategoryModel>> getAllCategory()  async{
    try {
      return await _dataSource.getAllCategory();
    } catch (e) {
      throw Exception('failed to get all Category : $e');
    }
  }

  @override
  Future<void> deleteCategory({required String id}) async {
    try {
      return await _dataSource.deleteCategory(id: id);
    } catch (e) {
      throw Exception('failed to get all Category : $e');
    }
  }
}
