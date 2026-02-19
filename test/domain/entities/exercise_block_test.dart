import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise_block.dart';

void main() {
  group('ExerciseBlock', () {
    test('should create ExerciseBlock correctly', () {
      final exercise = Exercise(
        paceName: "Endurance",
        zone: 2,
        duration: 600,
        pace: 360,
      );

      final block = ExerciseBlock(
        exercises: [exercise],
        repeat: 2,
        blockType: BlockType.recovery,
      );

      expect(block.exercises.length, 1);
      expect(block.exercises.first.paceName, "Endurance");
      expect(block.repeat, 2);
      expect(block.blockType, BlockType.recovery);
    });

    test('toBlockType returns correct BlockType for valid string', () {
      expect("recovery".toBlockType(), BlockType.recovery);
      expect("warmUp".toBlockType(), BlockType.warmUp);
      expect("none".toBlockType(), BlockType.none);
    });

    test('toBlockType returns default BlockType if string invalid', () {
      expect("invalid".toBlockType(), BlockType.warmUp);
      expect("".toBlockType(), BlockType.warmUp);
    });
  });
}
