// dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/data/model/category_model.dart';
import 'package:taskapp/data/repo/repository.dart';

class CategoryController extends GetxController {
  late final Repository _repository;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  /// Optional injection for tests; otherwise resolves with Get.find
  CategoryController({Repository? repository}) {
    if (repository != null) {
      _repository = repository;
    } else {
      _repository = Get.find<Repository>();
    }
  }

  @override
  void onInit() {
    super.onInit();
    // optionally load existing categories here if repository provides a read method
  }

  /// Adds a category. Returns `true` on success, `false` on failure.
  Future<bool> addCategory(String title, String dateTime) async {
    final trimmed = title.trim();
    if (trimmed.isEmpty) {
      Get.snackbar(
        'Validation',
        'Category name cannot be empty',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }

    try {
      final model = CategoryModel(title: trimmed, dateTime: dateTime);
      await _repository.addCategory(model);
      categories.add(model);
      update();
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add category',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      // Optionally log `e` somewhere
      return false;
    }
  }
}