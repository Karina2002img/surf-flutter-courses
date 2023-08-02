import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestureMaster',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const RotationTransitionExample(),
    );
  }
}

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});

  @override
  State<RotationTransitionExample> createState() =>
      _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  bool isTapped = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset position = Offset.zero;

  @override
  void didChangeDependencies() {
    position = Offset(MediaQuery.of(context).size.width / 2 - 100, MediaQuery.of(context).size.height / 2 - 100);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: position.dx,
              top: position.dy,
              child:
              GestureDetector(
                onLongPress: () {
                  _controller.forward(from: 0);
                },
                onTap: () {
                  setState(() {
                    isTapped = !isTapped;
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    position += details.delta;
                  });
                },
                child: RotationTransition(
                  turns: _animation,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: isTapped ? Colors.red : Colors.blue,
                      borderRadius: BorderRadius.circular(isTapped ? 100 : 0),
                    ),
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