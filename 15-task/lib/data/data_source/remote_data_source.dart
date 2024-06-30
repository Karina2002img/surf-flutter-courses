import 'package:dio/dio.dart';
import 'package:new_test_task15/data/models/result_model.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio);

  Future<ResultModel> fetchResult(String url) async {
    final response = await dio.get(url);
    return ResultModel.fromJson(response.data);
  }
}
