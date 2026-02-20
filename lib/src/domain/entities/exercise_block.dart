import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_block.freezed.dart';

@freezed
abstract class ExerciseBlock with _$ExerciseBlock {
  const factory ExerciseBlock({
    required List<Exercise> exercises,
    required int repeat,
    required BlockType blockType,
  }) = _ExerciseBlock;
}

enum BlockType { recovery, warmUp, none }

extension BlockTypeToStringExtension on BlockType {
  String getLabel() {
    return switch (this) {
      BlockType.recovery => 'récupération',
      BlockType.warmUp => 'échauffememt',
      BlockType.none => '',
    };
  }
}

extension BlockTypeExtension on String {
  BlockType toBlockType() {
    return BlockType.values.firstWhere(
      (e) => e.name == this,
      orElse: () => BlockType.warmUp,
    );
  }
}
