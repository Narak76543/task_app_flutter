import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/data/repo/repository.dart';
import 'package:taskapp/data/source/data_source.dart';
import 'package:taskapp/presentation/main_screen.dart';

import 'data/repo/repository_implement.dart';
import 'database/app_database.dart';

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final appDatabase = AppDatabase.instance;
    Get.put<AppDatabase>(appDatabase, permanent: true);

    Get.lazyPut<DataSource>(() => DataSource(Get.find()));
    Get.lazyPut<Repository>(() => RepositoryImpl(Get.find()));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialBinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
