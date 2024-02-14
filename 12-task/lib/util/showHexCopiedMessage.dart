import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

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