import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        toolbarHeight: 56,
        leading: Icon(Icons.arrow_back_ios_new_rounded, color: Color.fromRGBO(103, 205, 0, 1),weight: 2,),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Чек № 56',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 24,
                color: Color.fromRGBO(37, 40, 73, 1),
              ),
            ),
            // Text(
            //   '24.02.23 в 12:23',
            //   style: TextStyle(
            //     fontWeight: FontWeight.w400,
            //     fontSize: 10,
            //     height: 16,
            //     color: Color.fromRGBO(96, 96, 123, 1),
            //
            //   ),
            // ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
          width: MediaQuery.of(context).size.width,
          height: 32,
          color: Colors.red,
          margin: EdgeInsets.only(top: 24, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
            'Список покупок',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              //height: 24,
              color: Colors.black,
            ),
          ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color.fromRGBO(241, 241, 241, 1),
              ),
              child: Icon(Icons.sort_rounded, color: Color.fromRGBO(96, 96, 123, 1), size: 24,),
            )

          ],
          ),
          ),
        ],
      ),


    );


  }
}
// width: Hug (335px)
// height: Hug (32px)
// top: 124px
// left: 20px
