import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/data/models/session_model.dart';
import 'package:application_campus_coach_session/src/data/models/exercise_block_model.dart';
import 'package:application_campus_coach_session/src/data/models/exercise_model.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise_block.dart';

void main() {
  group('SessionModel to toEntity', () {
    late SessionModel model;

    setUp(() {
      model = SessionModel(
        id: "session_001",
        title: "Test Session",
        sessionIndex: 1,
        duration: 1800,
        distance: 5.0,
        difficulty: 2,
        type: "road",
        status: "todo",
        description: "Test description",
        coachAdvice: "Test advice",
        exerciseBlocks: [
          ExerciseBlockModel(
            exercises: [
              ExerciseModel(
                paceName: "Endurance",
                zone: 2,
                duration: 600,
                pace: 360,
              ),
            ],
            repeat: 2,
            blockType: "warmUp",
          ),
        ],
      );
    });

    test('should convert model to entity correctly', () {
      final result = model.toEntity();

      expect(result, isA<Session>());
      expect(result.id, "session_001");
      expect(result.title, "Test Session");
      expect(result.sessionIndex, 1);
      expect(result.duration, Duration(seconds: 1800));
      expect(result.distance, 5.0);
      expect(result.difficulty, 2);
      expect(result.type, SessionType.road);
      expect(result.status, SessionStatus.todo);
      expect(result.description, "Test description");
      expect(result.coachAdvice, "Test advice");

      expect(result.exerciseBlocks.length, 1);
      final block = result.exerciseBlocks.first;
      expect(block.repeat, 2);
      expect(block.blockType, BlockType.warmUp);

      final exercise = block.exercises.first;
      expect(exercise.paceName, "Endurance");
      expect(exercise.zone, 2);
      expect(exercise.duration, 600);
      expect(exercise.pace, 360);
    });

    test('should parse from JSON correctly', () {
      final json = {
        "id": "session_002",
        "title": "JSON Session",
        "sessionIndex": 2,
        "duration": 1200,
        "distance": 3.5,
        "difficulty": 3,
        "type": "trail",
        "status": "done",
        "description": "JSON description",
        "coachAdvice": "JSON advice",
        "exerciseBlocks": [
          {
            "exercises": [
              {"paceName": "VMA", "zone": 4, "duration": 900, "pace": 270},
            ],
            "repeat": 1,
            "blockType": "recovery",
          },
        ],
      };

      final modelFromJson = SessionModel.fromJson(json);

      expect(modelFromJson.id, "session_002");
      expect(modelFromJson.title, "JSON Session");
      expect(modelFromJson.exerciseBlocks.length, 1);
      expect(
        modelFromJson.exerciseBlocks.first.exercises.first.paceName,
        "VMA",
      );
    });
  });
}
