class Article {
  final int id;
  final String category;
  final String name;
  final int price;
  final int quantity;

  Article(this.id, this.category, this.name, this.price, this.quantity);
}

abstract class Filter {
  bool apply(Article article);
}

class CategoryFilter implements Filter {
  final String category;

  CategoryFilter(this.category);

  @override
  bool apply(Article article) {
    return article.category == category;
  }
}

class PriceFilter implements Filter {
  final int maxPrice;

  PriceFilter(this.maxPrice);

  @override
  bool apply(Article article) {
    return article.price <= maxPrice;
  }
}

class QuantityFilter implements Filter {
  final int maxQuantity;

  QuantityFilter(this.maxQuantity);

  @override
  bool apply(Article article) {
    return article.quantity < maxQuantity;
  }
}

void applyFilter(List<Article> articles, Filter filter) {
  print('Id\tКатегория\tНазвание\tЦена\tКоличество');
  for (var article in articles) {
    if (filter.apply(article)) {
      print('${article.id}\t${article.category}\t${article.name}\t${article.price} руб.\t${article.quantity} шт.');
    }
  }
}

void main() {
  //список товаров: одна строка - один товар (Id, Категория, Наименование, Цена, Количество)
  final articles = '''
  1,хлеб,Бородинский,500,5
  2,хлеб,Белый,200,15
  3,молоко,Полосатый кот,50,53
  4,молоко,Коровка,50,53
  5,вода,Апельсин,25,100
  6,вода,Бородинский,500,5
  ''';

  /*создаем переменную, которая будет хранить список объектов класса Article
  с помощью метода trim() удаляем пробелы в начале и конце строки articles;
  с помощью метода split('\n') разбиваем строку на список по символу переноса строки;
  вызываем метод map() для преобразования каждой строки списка в список полей (разделенных запятой).
  повторно вызываем метод map() для преобразования каждого списка полей в объект класса Article
  метод toList() вызываем для преобразования результата в список объектов класса Article
   */
  final articleList = articles
      .trim()
      .split('\n')
      .map((articleStr) => articleStr.split(','))
      .map((articleFields) => Article(
      int.parse(articleFields[0].trim()),
      articleFields[1].trim(),
      articleFields[2].trim(),
      int.parse(articleFields[3].trim()),
      int.parse(articleFields[4].trim())))
      .toList();

  //фильтрация по категории
  print('Товары из категории "хлеб"');
  final categoryFilter = CategoryFilter('хлеб');
  applyFilter(articleList, categoryFilter);
  print('');

  print('Товары, цена которых не превышает 250 руб.');
  //фильтрация по цене (не больше указанной)
  final priceFilter = PriceFilter(250);
  applyFilter(articleList, priceFilter);
  print('');

  print('Товары, количество которых меньше 10');
  //фильтрация по количеству остатков на складе (меньше указанной)
  final quantityFilter = QuantityFilter(10);
  applyFilter(articleList, quantityFilter);
}