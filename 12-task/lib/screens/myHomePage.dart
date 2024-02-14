import 'package:hexcolor/hexcolor.dart';
import 'package:clipboard/clipboard.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:copy_task12/util/mapJson.dart';
import 'package:copy_task12/screens/newScreen.dart';
import 'package:copy_task12/util/showHexCopiedMessage.dart';


//экран с сеткой
class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  late MapJson mapJson;

  @override
  void initState() {
    super.initState();
    mapJson = MapJson();
    mapJson.receivingMap();
  }

  @override
  Widget build(BuildContext context) {
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
        )).toList()
      ),
    );
  }
}