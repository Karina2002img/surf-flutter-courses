import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';

part 'model.dart';
part 'all.dart';


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













