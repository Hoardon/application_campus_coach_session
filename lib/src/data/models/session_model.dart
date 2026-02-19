import 'package:application_campus_coach_session/src/data/models/exercise_block_model.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
abstract class SessionModel with _$SessionModel {
  const factory SessionModel({
    required String id,
    required String title,
    required int sessionIndex,
    required int duration,
    required double distance,
    required int difficulty,
    required String type,
    required String status,
    required String description,
    required String coachAdvice,
    required List<ExerciseBlockModel> exerciseBlocks,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}

extension SessionModelMapper on SessionModel {
  Session toEntity() {
    return Session(
      id: id,
      title: title,
      sessionIndex: sessionIndex,
      duration: Duration(seconds: duration),
      distance: distance,
      difficulty: difficulty,
      type: type.toSessionType(),
      status: status.toSessionStatus(),
      description: description,
      coachAdvice: coachAdvice,
      exerciseBlocks: exerciseBlocks.map((e) => e.toEntity()).toList(),
    );
  }
}
