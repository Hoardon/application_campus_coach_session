import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';

void main() {
  group('Exercise', () {
    test('should create Exercise correctly', () {
      final exercise = Exercise(
        paceName: "Endurance fondamentale",
        zone: 2,
        duration: const Duration(minutes: 10),
        pace: const Duration(minutes: 6),
      );

      expect(exercise.paceName, "Endurance fondamentale");
      expect(exercise.zone, 2);
      expect(exercise.duration, const Duration(minutes: 10));
      expect(exercise.pace, 360);
    });

    test('two Exercises with same values should be equal', () {
      final exercise = Exercise(
        paceName: "Seuil",
        zone: 3,
        duration: const Duration(minutes: 15),
        pace: const Duration(minutes: 5),
      );

      final exercise2 = Exercise(
        paceName: "Seuil",
        zone: 3,
        duration: const Duration(minutes: 15),
        pace: const Duration(minutes: 5),
      );

      expect(exercise, exercise2);
    });
  });
}
