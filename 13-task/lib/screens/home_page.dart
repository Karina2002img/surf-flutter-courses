import 'package:flutter/material.dart';
import 'package:new_task13/components.dart';
import 'package:new_task13/screens/dialog_sheet.dart';
import 'package:new_task13/controller.dart';
import 'package:provider/provider.dart';
import 'package:new_task13/colorUI.dart';

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
            child: const Text(
              'Save',
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
                    child: const Text('Edit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
             Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text('Мои награды',
              style: Theme.of(context).textTheme.bodyLarge),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24, top: 12),
              child: Text(
                '🥇 🥇 🥉 🥈 🥉',
                style: TextStyle(fontSize: 32),
              ),
            ),
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const FormsContainer(textForm: 'Имя', textMok: 'Маркус'),
                      const FormsContainer(textForm: 'Email', textMok: 'MarkusHSS@gmail.com'),
                      const FormsContainer(textForm: 'Дата рождения', textMok: '03.03.1986'),
                      const FormsContainer(textForm: 'Команда', textMok: 'Сборная Швеции'),
                      FormsContainer(
                        textForm: 'Позиция',
                        textMok: 'Скип',
                        trailingIcon: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ),
                      FormsContainer(
                        textForm: 'Тема оформления',
                        textMok: themeNotifier.textTitleTheme(),
                        trailingIcon: const ModalBottomSheetDemo(),
                      ),
                    ],
                  ),
                ),
            ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 30),
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 48.0),
                  foregroundColor: AppColors.titleColorButtonLogOut,
                  side: const BorderSide(color: AppColors.borderColorButtonLogOut),
                ),
                child: const Text('Log Out'),
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
