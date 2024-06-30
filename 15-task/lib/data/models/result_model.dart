import 'package:new_test_task15/domain/entities/result_entity.dart';

class ResultModel extends ResultEntity {
  ResultModel({required super.reading});

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      reading: json['reading'] as String,
    );
  }
}
