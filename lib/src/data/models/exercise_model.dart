import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
abstract class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    required String paceName,
    required int zone,
    required int duration,
    required int pace,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);
}

extension ExerciseModelMapper on ExerciseModel {
  Exercise toEntity() {
    return Exercise(
      paceName: paceName,
      zone: zone,
      duration: Duration(seconds: duration),
      pace: Duration(seconds: pace),
    );
  }
}
