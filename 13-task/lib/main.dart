import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_task13/screens/home_page.dart';
import 'package:new_task13/controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
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
