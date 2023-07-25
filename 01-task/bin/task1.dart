/* Задание:Для аналитика потребовалось узнать средний возраст всей техники
и средний возраст техники для 50% самой старой техники
(нужно отсортировать всю технику по возрасту, взять 50% самой старой техники
 и вычислить их средний возраст).
*/
//Исходный код:
enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
      this.areaInHectare,
      this.crops,
      this.machineries,
      );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
      this.id,
      this.releaseDate,
      );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};
//Решение задачи:
void main(){
  Map<String, int> newMapBefore2010 = {};
  for (final countryTerritories in mapBefore2010.values) {
    for (final territory in countryTerritories) {
      for (final machinery in territory.machineries) {
        newMapBefore2010[machinery.id] = machinery.releaseDate.toLocal().year;
      }
    }
  }
  Map<String, int> newMapAfter2010 = {};
  for (final countryTerritories in mapAfter2010.values) {
    for (final territory in countryTerritories) {
      for (final machinery in territory.machineries) {
        newMapAfter2010[machinery.id] = machinery.releaseDate.toLocal().year;
      }
    }
  }
  print('Словарь до 2010');
  print(newMapBefore2010);
  print('');
  print('Словарь после 2010');
  print(newMapAfter2010);
  print('');
  print('Объединенный словарь');
  final unitedMap = {...newMapBefore2010, ...newMapAfter2010};
  print(unitedMap);

  int currentYear = 2023;
  int totalAge = unitedMap.values.fold(0, (sum, year) => sum + (currentYear - year));
  double averageAge = totalAge / unitedMap.length;
  var roundAverageAge = averageAge.round();
  print('');
  print('Средний возраст всей техники: $roundAverageAge');

  print('');
  print('Отсортированный объединенный словарь');
  var sortedMap = unitedMap.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));
  var sortedDict = {};
  for (var entry in sortedMap) {
    sortedDict[entry.key] = entry.value;
  }
  print(sortedDict);

  var sortedMap1 = unitedMap.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));
  var halfIndex = (sortedMap1.length / 2).floor();
  var sum = 0;
  for (var i = 0; i < halfIndex; i++) {
    sum += sortedMap[i].value;
  }
  var averageAge1 = 2023 - sum / halfIndex;
  var roundAverageAge1 = averageAge1.round();
  print('');
  print('Средний возраст 50% самой старой техники : $roundAverageAge1');

}

