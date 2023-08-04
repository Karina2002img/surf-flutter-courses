import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visit card',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Color.fromRGBO(255, 204, 255, 1),
          useMaterial3: true,
          fontFamily: 'Borel'),
      home: const MyHomePage(title: 'Welcome to my page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.white60,
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/my_photo.JPG'),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                    Text(
                      'About me:',
                      style: TextStyle(
                        fontSize: 40,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    //),
                    Text(
                      'I am Karina.\nI am 21 y.o.\nI study and live in \nKaliningrad. ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / (3.615 / 2),
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            //color: Colors.redAccent,

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                Text(
                  'A litle more:',
                  style: TextStyle(
                    fontSize: 40,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                    Text(
                      'My experience',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                    Text(
                      'My hobby',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/experience.svg',
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/sphinx.svg',
                      width: 100,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                    ),
                    Text(
                      'A little C, and\n a little more\n Python',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                    ),
                    Text(
                      'I like plants,\n creativity and\n sports, now I am\n learning to swim',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}