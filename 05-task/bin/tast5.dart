class Human {
  final String name;
  int age;

  Human(this.name, this.age);

  void loveSport(){
    print('Я люблю спорт!');
  }
  @override
  String toString(){
    var aboutMe = '''
    Имя: $name
    Возраст: $age
    ''';
    return aboutMe;
  }
}
class Sportsman extends Human {
  String sport;
  int quantityVictories;

  Sportsman(String name, int age, this.sport, this.quantityVictories)
      : super(name, age);
  @override
  String toString() {
    var aboutMe = '''
    Вид спорта: $sport
    Количество побед в сезоне: $quantityVictories
    ''';
    aboutMe += super.toString();
    return aboutMe;
  }

  void discharge() {
    if (age > 12 && quantityVictories > 2) {
      print('$name имеет I разряд');
    }
  }
}

class Trainer extends Human{
  int numberOfStudents;
  String qualification;
  Trainer(String name, int age, this.qualification, this.numberOfStudents)
      : super(name, age);

  @override
  String toString() {
    var aboutMe = 'Квалификация: $qualification';
    aboutMe += super.toString();
    return aboutMe;
  }
}


class Team extends Sportsman {
  final int numberOfPlayers;

  Team(String name, int age, String sport, int quantityVictories, this.numberOfPlayers)
      : super(name, age, sport, quantityVictories);

  void readyToPlay(){
    if(numberOfPlayers > 1 ){
      print('Команда собрана');
    }
  }
}

void main(){
  final gamer1 = Team('Мария', 25, 'Большой теннис', 4, 2 );
  print(gamer1);
  gamer1.loveSport();
  gamer1.discharge();
  gamer1.readyToPlay();

  final trainer = Trainer('Елена', 45, 'Высшая', 8);
  print('');
  print(trainer);
}
