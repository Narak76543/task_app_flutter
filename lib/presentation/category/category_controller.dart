// dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/data/model/category_model.dart';
import 'package:taskapp/data/repo/repository.dart';

class CategoryController extends GetxController {
  late final Repository _repository;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

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
    getAllCategory();
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
      categories.add(model); // RxList will notify Obx; call update() if using GetBuilder
      update();
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add category',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }
  }

  Future<void> getAllCategory() async {
    try {
      final result = await _repository.getAllCategory();
      categories.assignAll(result ?? <CategoryModel>[]); // replace content atomically
      update(); // keep for GetBuilder; safe even with Obx
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch categories',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
