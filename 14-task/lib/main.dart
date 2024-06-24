import 'package:flutter/material.dart';
import 'package:task14/data/repository/photos_repository.dart';
import 'package:task14/presentation/grid_photos_screen.dart';

void main() {
  runApp(const MyApp());
}

final photosRepository = PhotosRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Постограм',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GridPhotosScreen(),
    );
  }
}
