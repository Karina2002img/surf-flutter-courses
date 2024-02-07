part of 'main.dart';

class ProductEntity {
  final String title;
  final int price;
  final Category category;
  final String imageUrl;
  final Amount amount;
  final double sale;

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });
  int get discountedPrice => (price * (100 - sale) / 100).floor();

}

sealed class Amount {
  int get value;
}

class Grams implements Amount {
  @override
  final int value;
  Grams(this.value);
}

class Quantity implements Amount {
  @override
  final int value;
  Quantity(this.value);
}
enum Category {
  food('Продукты питания'),
  tech('Технологичные товары'),
  care('Уход'),
  drinks('Напитки'),
  drugs('Медикаменты');

  final String value;
  const Category(this.value);

  @override
  String toString() => value;

}

