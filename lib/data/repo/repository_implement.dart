// lib/data/repo/repository_impl.dart

import 'package:taskapp/data/model/category_model.dart';
import 'package:taskapp/data/repo/repository.dart';
import 'package:taskapp/data/source/data_source.dart'; // We will create this next

// This is the concrete implementation of our Repository contract.
class RepositoryImpl implements Repository {
  final DataSource _dataSource;

  // We ask for a DataSource when this class is created.
  RepositoryImpl(this._dataSource);

  @override
  Future<void> addCategory(CategoryModel category) {
    // The repository delegates the actual work to the data source.
    return _dataSource.addCategory(category);
  }
}