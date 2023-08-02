import 'package:flutter/material.dart';

/// Flutter code sample for [RotationTransition].

void main() => runApp(const RotationTransitionExampleApp());

class RotationTransitionExampleApp extends StatelessWidget {
  const RotationTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RotationTransitionExample(),
    );
  }
}

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});

  @override
  State<RotationTransitionExample> createState() =>
      _RotationTransitionExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   double angle = 0.0;
//   Offset position = Offset(0, 0);
//   bool isRotating = false;
//   bool isTapped = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           left: position.dx,
//           top: position.dy,
//           child: GestureDetector(
//             onTap: () {
//               setState(() {
//                 isTapped = !isTapped;
//               });
//             },
//             onPanUpdate: (details) {
//               setState(() {
//                 position += details.delta;
//               });
//             },
//             onLongPress: () {
//               setState(() {
//                 isRotating = true;
//               });
//             },
//             onLongPressEnd: (details) {
//               setState(() {
//                 isRotating = false;
//               });
//             },
//             child:
//             Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: isTapped ? Colors.red : Colors.blue,
//                 borderRadius: BorderRadius.circular(isTapped ? 100 : 0),
//               ),
//               child: Center(
//                 child: Text(
//                   'Tap me',
//                   style: TextStyle(
//                     color: Colors.white,
//
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned.fill(
//           child: GestureDetector(
//             onPanUpdate: (details) {
//               setState(() {
//                 position += details.delta;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _rotate(double radians) {
//     setState(() {
//       angle += radians;
//     });
//   }
//

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _startRotation();
//     });
//   }
//
//   void _startRotation() async {
//     while (true) {
//       if (isRotating) {
//         _rotate(0.1);
//       }
//       await Future.delayed(Duration(milliseconds: 16));
//     }
//   }
// }