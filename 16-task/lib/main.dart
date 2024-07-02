import 'package:flutter/material.dart';
import 'package:test_task16/presentation/screens/registration_screen.dart';
import 'package:test_task16/utils/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Validation form',
      theme: appTheme,
      home: const RegistrationScreen(),
    );
  }
}
