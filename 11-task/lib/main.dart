import 'package:flutter/material.dart';
import 'dart:math';
part 'my_classes.dart';
part 'productEntity.dart';

///Методы для базового листвью
//считаем общую стоимость покупки без скидки
double calculateTotalCost(List<ProductEntity> products) {
  double totalCost = 0;
  for (var product in products) {
    totalCost += product.price;
  }
  totalCost = totalCost / 100;
  return totalCost;
}
double totalCost = calculateTotalCost(dataForStudents);

//считаем стоимость со скидкой
double calculateCostAfterSale(List<ProductEntity> products) {
  double newTotalCost = 0;
  for (var product in products) {
    if (product.sale != 0) {
      newTotalCost += product.price * product.sale / 10000;
    }
  }
  newTotalCost = totalCost - newTotalCost;
  return newTotalCost;
}
double newTotalCost = calculateCostAfterSale(dataForStudents);

//считаем процент скидки от всей покупки
double calculateSaleAmount(List<ProductEntity> products) {
  double totalSaleAmount = 0;
  for (var product in products) {
    if (product.sale != 0) {
      totalSaleAmount += product.price * product.sale / 10000;
    }
  }
  return totalSaleAmount;
}
double saleAmount = calculateSaleAmount(dataForStudents);
double discountPercentage = (saleAmount / totalCost) * 100;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '6-ka',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          fontFamily: 'Sora'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SortValue {fromAtoZtitle, fromZtoAtitle, fromLessToMore, fromMoreToLess,}

class _MyHomePageState extends State<MyHomePage> {

  SortValue? _sortValue = SortValue.fromAtoZtitle;

  final int countCategory = Category.values.length;
  final List enumCategoryValue = Category.values;
  final int countProduct = dataForStudents.length;

  bool isLoading = false;
  List<ProductEntity>? data;
  List<ProductEntity> myLoadedData = dataForStudents;
  @override
  Widget build(BuildContext context) {

    @override
      loadData() async {
      // загрузка данных
      setState(() {
        isLoading = true;
      });
      data = await loadData();
      setState(() {
        isLoading = false;
      });
    }

    void initState() {
      super.initState();
      loadData();
    }

    //функция для сортировки данных через модульное окно
    void _applySort(Map<Category, List<ProductEntity>> groupedProducts) {

      for (var category in groupedProducts.keys) {
        if (_sortValue == SortValue.fromAtoZtitle) {
          groupedProducts[category]!.sort((a, b) => a.title.compareTo(b.title));
        } else if (_sortValue == SortValue.fromZtoAtitle) {
          groupedProducts[category]!.sort((a, b) => b.title.compareTo(a.title));
        } else if (_sortValue == SortValue.fromLessToMore) {
          groupedProducts[category]!.sort((a, b) => a.discountedPrice.compareTo(b.discountedPrice));
        } else if (_sortValue == SortValue.fromMoreToLess) {
          groupedProducts[category]!.sort((a, b) => b.discountedPrice.compareTo(a.discountedPrice));
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 56,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color.fromRGBO(103, 205, 0, 1),
          weight: 2,
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Чек № 56',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(37, 40, 73, 1),
                  fontFamily: 'Sora'),
              children: <TextSpan>[
                TextSpan(
                  text: '\n24.02.23 в 12:23',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
        ),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
      : Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 32,
            //color: Colors.red,
            margin: EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Список покупок',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color.fromRGBO(241, 241, 241, 1),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.sort_rounded,
                        size: 24,
                        color: Color.fromRGBO(96, 96, 123, 1),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          useRootNavigator: true,
                          context: context,
                          builder: (BuildContext context) {
                            return FractionallySizedBox(
                              heightFactor: 0.5,
                              child: Container(
                                child:
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Сортировка',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                        StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setState) {
                                        return Expanded(
                                        child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                        Divider(),
                                        itemCount: 2,
                                        itemBuilder: (context, index){
                                          if (index == 0){
                            return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            RadioListTile(
                            title: Text('По имени от А до Я'),
                            value: SortValue.fromAtoZtitle,
                            groupValue: _sortValue,
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                            onChanged: (
                            SortValue? value) {
                            setState(() {
                            _sortValue = value;
                            _applySort(groupedProducts);
                            });},
                            ),
                            RadioListTile(
                            title: Text('По имени от Я до А'),
                            value: SortValue.fromZtoAtitle,
                            groupValue: _sortValue,
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                            onChanged: (
                            SortValue? value) {
                            setState(() {
                            _sortValue = value;
                            _applySort(groupedProducts);
                            });},
                            ),
                            ],
                            );

                            }if (index == 1){
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RadioListTile(
                                                    title: Text('По возрастанию'),
                                                    value: SortValue.fromLessToMore,
                                                    groupValue: _sortValue,
                                                    fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                                                    onChanged: (
                                                        SortValue? value) {
                                                      setState(() {
                                                        _sortValue = value;
                                                        _applySort(groupedProducts);
                                                      });},
                                                  ),
                                                  RadioListTile(
                                                    title: Text('По убыванию'),
                                                    value: SortValue.fromMoreToLess,
                                                    groupValue: _sortValue,
                                                    fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                                                    onChanged: (
                                                        SortValue? value) {
                                                      setState(() {
                                                        _sortValue = value;
                                                        _applySort(groupedProducts);
                                                      });},
                                                  ),
                                                ],
                                              );
                                            };

                                        }
                                        )
                                        );
                                        }
                                        ),

                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 48,
                                      child: FittedBox(
                                        child: ElevatedButton(
                                          child: Text('Готово',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(103, 205, 0, 1),
                                            elevation: 0,
                                            fixedSize: Size(MediaQuery.of(context).size.width,48.0),
                                          ),
                                          // elevation: 1,
                                          onPressed: () => {
                                          setState(() {
                                          // обновление состояния виджета
                                          }),
                                            Navigator.pop(context, _sortValue)
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                              ),
                            ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              shrinkWrap: true,
              itemCount: groupedProducts.length,
              itemBuilder: (context, categoryIndex) {
                var category = groupedProducts.keys.toList()[categoryIndex];
                var products = groupedProducts[category]!;
                return Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        category.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, productIndex) {
                        var product = products[productIndex];
                        Color randomColour = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
                        double sizeWhiteContainer = MediaQuery.of(context).size.width - 64 - 12 - 40;
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          //color: randomColour,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: SizedBox.square(
                                  dimension: 64,
                                  child: Image.network(
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(child: Text('Здесь пока ничего нет'));
                                    },
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                width: sizeWhiteContainer,
                                height: 68,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                          product.title,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                          Text(
                                              '${product.amount is Grams ? product.amount.value / 1000 : product.amount.value}'
                                              '${product.amount is Grams ? 'кг' : 'шт'}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                         if (product.sale != 0)
                                           Row(
                                             children: [
                                               Text('${product.price/100}'+' руб ',
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   fontWeight: FontWeight.w400,
                                                   color: Colors.grey,
                                                   decoration: TextDecoration.lineThrough,

                                                 ),
                                               ),
                                               Text('${product.sale * product.price/10000 }' +' руб',
                                                 style: TextStyle(
                                                   color: Colors.red,
                                                   fontSize: 12,
                                                   fontWeight: FontWeight.w700,
                                                 ),
                                               ),
                                             ],
                                           )
                                         else
                                           Text('${product.price/100}'+' руб',
                                             style: TextStyle(
                                               fontSize: 12,
                                               fontWeight: FontWeight.w700,
                                             ),
                                           ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                );
              },
            ),
          ),
          Container(
            //color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            height: 118,
            margin: EdgeInsets.only(top: 14, left: 20, right: 20, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('В вашей покупке',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$countProduct товаров',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text('$totalCost' + ' руб',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Скидка ' +
                        discountPercentage.toStringAsFixed(2).toString() +
                        ' %',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    ),
                    Text('-'+'${totalCost * discountPercentage / 100}'+' руб',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Итого',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text('$newTotalCost'+' руб',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: Color.fromRGBO(103, 205, 0, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_mall),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Личное',
          )
        ],
      ),
    );
  }
}
