import 'package:flutter/material.dart';
import 'package:taskapp/database/app_database.dart';
import 'package:taskapp/presentation/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _init();
  runApp(const MyApp());
}
Future <void> _init() async {
  await AppDatabase.instance.db;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MainScreen(),
    );
  }
}
