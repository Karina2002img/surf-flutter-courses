class IndoorFlower {
  static const String kingdom = 'Растения';
  final String name;
  final String climateZone;
  final DateTime seedEntry;
  int potDiameter;

  int get age => DateTime.now().year - seedEntry.year;

  IndoorFlower(
      {required this.name,
      required this.climateZone,
      required this.seedEntry,
      required this.potDiameter});

  void createOxygen() {
    print('$kingdom создают кислород, которым мы дышим');
  }

  void reproduction() {
    if (age >= 1) {
      print('$name достигло возраста размножения');
    } else {
      print('$name не достигло возраста размножения');
    }
  }

  @override
  String toString() {
    var aboutMe = '''
    Царство: $kingdom
    Название: $name
    Климатическая зона: $climateZone
    Дата всхода семян: $seedEntry
    Возраст растения: $age
    Диаметр горшка: $potDiameter
    ''';
    return aboutMe;
  }
}

class Aroid extends IndoorFlower {
  final int humidity;

  Aroid(this.humidity, String name, String climateZone, DateTime seedEntry, int potDiameter)
      : super(
          name: name,
          climateZone: climateZone,
          seedEntry: seedEntry,
          potDiameter: potDiameter,
        );

  void greenhouse() {
    if (humidity < 40) {
      print('Растению необходима теплица');
    }
  }
}

void main() {
  final monstera = Aroid(20, 'Монстера манки', 'Тропики', DateTime(2022, 11, 9), 12);
  print(monstera);
  monstera.createOxygen();
  monstera.greenhouse();
  monstera.reproduction();
}
