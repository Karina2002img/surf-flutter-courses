import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_test_task15/data/repository/ball_repository_impl.dart';
import 'package:new_test_task15/domain/repository/ball_repository.dart';
import 'package:new_test_task15/domain/usecases/get_result_usecase.dart';
import 'package:new_test_task15/presentation/screens/ball_screen.dart';
import 'package:new_test_task15/utils/custom_colors.dart';

final dio = Dio();
const baseUrl = 'https://eightballapi.com/api';

void main() {
  final BallRepository ballRepository = BallRepositoryImpl(
    dio: dio,
    baseUrl: baseUrl,
  );
  final GetResultUseCase getResultUseCase = GetResultUseCase(ballRepository);

  runApp(MyApp(getResultUseCase: getResultUseCase));
}

class MyApp extends StatelessWidget {
  final GetResultUseCase getResultUseCase;

  const MyApp({super.key, required this.getResultUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic Ball',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: CustomColors.colorGray,
          ),
          titleLarge: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      home: BallScreen(getResultUseCase: getResultUseCase),
    );
  }
}
