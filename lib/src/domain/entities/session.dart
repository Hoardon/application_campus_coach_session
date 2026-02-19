import 'package:application_campus_coach_session/src/domain/entities/exercise_block.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required String title,
    required int sessionIndex,
    required Duration duration,
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

extension SessionTypeExtension on String {
  SessionType toSessionType() {
    return SessionType.values.firstWhere(
      (e) => e.name == this,
      orElse: () => SessionType.road,
    );
  }
}

enum SessionStatus { todo, done, skipped }

extension SessionStatusExtension on String {
  SessionStatus toSessionStatus() {
    return SessionStatus.values.firstWhere(
      (e) => e.name == this,
      orElse: () => SessionStatus.todo,
    );
  }
}
