import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_task13/screens/home_page.dart';
import 'package:new_task13/controller.dart';
import 'package:new_task13/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<int>('settings'); // Создание или открытие хранилища

  final storageService = StorageService();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(storageService),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          home: const MyHomePage(),
          theme: themeNotifier.currentThemeData,
        );
      },
    );
  }
}