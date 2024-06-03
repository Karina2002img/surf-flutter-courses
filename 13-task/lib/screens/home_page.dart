import 'package:flutter/material.dart';
import 'package:new_task13/screens/dialog_sheet.dart';
import 'package:new_task13/controller.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Transform.rotate(
          angle: 180 * 3.1415926535 / 180,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward),
          ),
        ),
        title: const Text('Профиль'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(color: Theme.of(context).appBarTheme.actionsIconTheme?.color),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/83168db9772cb4e6e4fc2e5851a0de1b.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  top: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Edit'),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text('Мои награды'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24, top: 12),
              child: Text(
                '🥇 🥇 🥉 🥈 🥉',
                style: TextStyle(fontSize: 32),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 20,
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width,
                height: 60, //нужно поправить
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Имя'),
                        Text('Маркус'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 20,
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width,
                height: 60, //нужно поправить
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email'),
                        Text('MarkusHSS@gmail.com'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 20,
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width,
                height: 60, //нужно поправить
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Дата рождения'),
                        Text('03.03.1986'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 20,
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width,
                height: 60, //нужно поправить
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Команда'),
                        Text('Сборная Швеции'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 20,
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width,
                height: 60, //нужно поправить
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Позиция'),
                        Text('Скип'),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 20,
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width,
                height: 60, //нужно поправить
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Тема оформления'),
                        Text(themeNotifier.textTitleTheme()),
                      ],
                    ),
                    ModalBottomSheetDemo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
