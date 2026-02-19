import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/data/models/exercise_model.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';

void main() {
  group('ExerciseModel to toEntity', () {
    late ExerciseModel model;

    setUp(() {
      model = ExerciseModel(
        paceName: "Seuil",
        zone: 3,
        duration: 600,
        pace: 300,
      );
    });

    test('should convert model to entity correctly', () {
      final result = model.toEntity();

      expect(result, isA<Exercise>());
      expect(result.paceName, "Seuil");
      expect(result.zone, 3);
      expect(result.duration, 600);
      expect(result.pace, 300);
    });

    test('should parse from JSON correctly', () {
      final json = {"paceName": "VMA", "zone": 4, "duration": 900, "pace": 270};

      final modelFromJson = ExerciseModel.fromJson(json);

      expect(modelFromJson.paceName, "VMA");
      expect(modelFromJson.zone, 4);
      expect(modelFromJson.duration, 900);
      expect(modelFromJson.pace, 270);
    });
  });
}
