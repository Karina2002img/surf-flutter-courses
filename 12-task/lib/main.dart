import 'package:flutter/material.dart';
import 'package:copy_task12/screens/splashScreen.dart';




void main() {
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palette of colors',
      theme: ThemeData(
        fontFamily: 'ubuntu',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}













