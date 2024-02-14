import 'dart:convert';
import 'package:copy_task12/model.dart';


//декодирование джейсона и создание словаря {цвет: значение}, цвета без значения в словарь не попадают
class MapJson{
  final Map<String, String> colorMap = {};
  final decodedJson = json.decode(colors);

  void receivingMap(){
    for (final color in decodedJson['colors']) {
      if (color.containsKey('value')) {
        colorMap[color['name']] = color['value'];
      }

    }
  }
}
