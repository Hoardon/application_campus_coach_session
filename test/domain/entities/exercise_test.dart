import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';

void main() {
  group('Exercise', () {
    test('should create Exercise correctly', () {
      final exercise = Exercise(
        paceName: "Endurance fondamentale",
        zone: 2,
        duration: 600,
        pace: 360,
      );

      expect(exercise.paceName, "Endurance fondamentale");
      expect(exercise.zone, 2);
      expect(exercise.duration, 600);
      expect(exercise.pace, 360);
    });

    test('two Exercises with same values should be equal', () {
      final exercise = Exercise(
        paceName: "Seuil",
        zone: 3,
        duration: 900,
        pace: 300,
      );

      final exercise2 = Exercise(
        paceName: "Seuil",
        zone: 3,
        duration: 900,
        pace: 300,
      );

      expect(exercise, exercise2);
    });
  });
}
