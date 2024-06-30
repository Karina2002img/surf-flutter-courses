import 'package:dio/dio.dart';
import 'package:new_test_task15/data/models/result_model.dart';
import 'package:new_test_task15/domain/repository/ball_repository.dart';

class BallRepositoryImpl implements BallRepository {
  final Dio dio;
  final String baseUrl;

  BallRepositoryImpl({required this.dio, required this.baseUrl});

  @override
  Future<ResultModel> getResultBall() async {
    final response = await dio.get(baseUrl);
    return ResultModel.fromJson(response.data);
  }
}
