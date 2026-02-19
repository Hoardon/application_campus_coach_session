import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/data/models/exercise_block_model.dart';
import 'package:application_campus_coach_session/src/data/models/exercise_model.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise_block.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';

void main() {
  group('ExerciseBlockModel to toEntity', () {
    late ExerciseBlockModel model;

    setUp(() {
      model = ExerciseBlockModel(
        exercises: [
          ExerciseModel(
            paceName: "Endurance",
            zone: 2,
            duration: 600,
            pace: 360,
          ),
        ],
        repeat: 3,
        blockType: "warmUp",
      );
    });

    test('should convert model to entity correctly', () {
      final result = model.toEntity();

      expect(result, isA<ExerciseBlock>());
      expect(result.repeat, 3);
      expect(result.blockType, BlockType.warmUp);

      expect(result.exercises.length, 1);
      expect(result.exercises.first, isA<Exercise>());
      expect(result.exercises.first.paceName, "Endurance");
      expect(result.exercises.first.zone, 2);
    });

    test('should fallback to default BlockType if invalid string', () {
      final invalidModel = model.copyWith(blockType: "invalid");

      final result = invalidModel.toEntity();

      expect(result.blockType, BlockType.warmUp);
    });

    test('should parse from JSON correctly', () {
      final json = {
        "exercises": [
          {"paceName": "Endurance", "zone": 2, "duration": 600, "pace": 360},
        ],
        "repeat": 2,
        "blockType": "warmUp",
      };

      final model = ExerciseBlockModel.fromJson(json);

      expect(model.repeat, 2);
      expect(model.blockType, "warmUp");
      expect(model.exercises.length, 1);
    });
  });
}
