import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter 2.0'),
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
  int _counter = 0;
  int _counterCliksDecrement = 0;
  int _counterCliksIncrement = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counterCliksIncrement++;
    });
  }
  void _decrementCounter() {
  if (_counter > 0) {
    setState(() {
      _counter--;
      _counterCliksDecrement++;
    });
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ошибка'),
          content: Text('Счетчик не может быть отрицательным'),
          actions: <Widget>[
            TextButton(
              child: Text('ОК'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Количество нажатий на "-": $_counterCliksDecrement'
            ),
            Text(
              'Количество нажатий на "+": $_counterCliksIncrement'
            ),
          ],
        ),
        

      ),

      floatingActionButton: SizedBox(
        width: 380,
        height: MediaQuery.of(context).size.height,

        child: 
        Stack(
  
        children: [
          
          
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: 
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            
          
          ),
      ),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child:
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            
          ),
        ), 

      ],
      
      ),
      ),
    );
  }
}