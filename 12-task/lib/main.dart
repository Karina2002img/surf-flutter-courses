import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'screens/splashScreen.dart';




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

// функция показа сообщения об успешном копировании hex
void showHexCopiedMessage(BuildContext context) {
  Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: Colors.white,
    duration: const Duration(seconds: 3),
    messageText: const Center(
      child: Text(
        "Hex скопирован",
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    ),
  ).show(context);
}











