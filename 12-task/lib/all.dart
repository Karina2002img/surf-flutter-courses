part of 'main.dart';


//экран загрузки данных
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Имитация загрузки данных
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(), // Индикатор загрузки
          ],
        ),
      ),
    );
  }
}

//экран с сеткой
class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final mapJson = MapJson();
    mapJson.receivingMap();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Эксклюзивная палитра «Colored Box»',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 2,
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        childAspectRatio: 0.75,
        children: mapJson.colorMap.keys.map((colorValue) => GestureDetector(
          //при нажатии переход на новый экран
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  NewScreen(appBarColor: HexColor((mapJson.colorMap[colorValue]).toString(),),
                    titleNameColor: colorValue,
                    codeColor: (mapJson.colorMap[colorValue]!).substring(1),
                  ),
              ),
            );
          },
          //при долгом нажатии - копирование в буфер обмена
          onLongPress: () {
            FlutterClipboard.copy(mapJson.colorMap[colorValue]!).then((value) {
              showHexCopiedMessage(context);
            });
          },

          //содержимое каждой ячейки
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor((mapJson.colorMap[colorValue]).toString()),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    colorValue,
                    maxLines: 1,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(mapJson.colorMap[colorValue]!),
                ),
              ],
            ),
          ),
        )).toList(),
      ),
    );
  }
}

//виджет для контейнеров с повторяющимися свойствами
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





//новый экран с конкретным цветом
class NewScreen extends StatefulWidget {
  final Color appBarColor;
  final String titleNameColor;
  final String codeColor;

  NewScreen({
    required this.appBarColor,
    required this.titleNameColor,
    required this.codeColor,
  });

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final containerHeight = screenHeight / 3;
    final codeRed = widget.appBarColor.red;
    final codeGreen = widget.appBarColor.green;
    final codeBlue = widget.appBarColor.blue;


    return Scaffold(
      appBar: AppBar(
        title: null,
        backgroundColor: widget.appBarColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            color: widget.appBarColor,
            height: containerHeight,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 16.0,
            ),
            alignment: Alignment.centerLeft,
            //color: Colors.lightGreenAccent,
            child: Text(
              widget.titleNameColor,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
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
              alignment: Alignment.centerLeft,
              height: 56,
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hex',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'ubuntu',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.codeColor}   ',
                      ),
                      IconButton(
                        icon: const Icon(Icons.content_copy),
                          onPressed: () {
                            FlutterClipboard.copy(widget.codeColor).then((value) {
                              showHexCopiedMessage(context);
                            });
                          },),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              coloredContainer(
                context,
                'Red',
                '$codeRed',
                const EdgeInsets.only(left: 16, right: 16, top: 16),
              ),
              coloredContainer(
                context,
                'Green',
                '$codeGreen',
                const EdgeInsets.only(right: 16, top: 16),
              ),
              coloredContainer(
                context,
                'Blue',
                '$codeBlue',
                const EdgeInsets.only(right: 16, top: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}