import 'package:new_test_task15/domain/entities/result_entity.dart';
import 'package:new_test_task15/domain/repository/ball_repository.dart';

class GetResultUseCase {
  final BallRepository repository;

  GetResultUseCase(this.repository);

  Future<ResultEntity> call() async {
    return await repository.getResultBall();
  }
}
