part of 'main.dart';

const String colors = """
{
"colors": [
{
"name": "Burnt Sienna",
"value": "#ED6161"
},
{
"name": "Razzmatazz",
"value": "#EF0B58"
},
{
"name": "Trinidad",
"value": "#EF560B"
},
{
"name": "Harlequin",
"value": "#2BEF0B"
},
{
"name": "Zombie"
},
{
"name": "Chartreuse",
"value": "#7FEF0B"
},
{
"name": "Malachite",
"value": "#0BEF6E"
},
{
"name": "Azure Radiance",
"value": "#0B76EF"
},
{
"name": "Bright Turquoise",
"value": "#0BC9EF"
},
{
"name": "Edgewater"
},
{
"name": "Dodger Blue",
"value": "#5249FD"
},
{
"name": "Pink Flamingo",
"value": "#FD49EE"
},
{
"name": "Shocking"
},
{
"name": "Golden Fizz",
"value": "#EBFD49"
},
{
"name": "Aquamarine",
"value": "#49FDF0"
}
]
}
""";

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

