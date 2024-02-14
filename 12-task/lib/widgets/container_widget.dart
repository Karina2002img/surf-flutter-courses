import 'package:flutter/material.dart';


//виджет для контейнеров с повторяющимися свойствами на новом экране
Widget coloredContainer(
    BuildContext context,
    String text,
    String colorValue,
    EdgeInsets padding, // Добавляем параметр для указания отступов
    ) {
  return Padding(
    padding: padding,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x37394A14),
            offset: Offset(0, 12),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      width: ((MediaQuery.of(context).size.width - 64) / 3),
      height: 50,
      alignment: Alignment.center,
      child: Text('$text  $colorValue'),
    ),
  );
}