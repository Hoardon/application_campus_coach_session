import 'package:application_campus_coach_session/src/domain/entities/exercise_block.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required String title,
    required int sessionIndex,
    required int duration,
    required double distance,
    required int difficulty,
    required SessionType type,
    required SessionStatus status,
    required String description,
    required String coachAdvice,
    required List<ExerciseBlock> exerciseBlocks,
  }) = _Session;
}

enum SessionType { road, trail }

enum SessionStatus { todo, done, skipped }
