import 'package:new_test_task15/domain/entities/result_entity.dart';

abstract class BallRepository {
  Future<ResultEntity> getResultBall();
}
