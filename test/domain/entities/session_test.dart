import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise_block.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';

void main() {
  group('Session', () {
    late Session session;
    late ExerciseBlock exerciseBlock;

    setUp(() {
      exerciseBlock = ExerciseBlock(
        exercises: [
          Exercise(
            paceName: "Endurance",
            zone: 2,
            duration: const Duration(minutes: 10),
            pace: const Duration(minutes: 6),
          ),
        ],
        repeat: 2,
        blockType: BlockType.warmUp,
      );

      session = Session(
        id: "s1",
        title: "Session 1",
        sessionIndex: 1,
        duration: const Duration(minutes: 30),
        distance: 5.0,
        difficulty: 2,
        type: SessionType.road,
        status: SessionStatus.todo,
        description: "Description 1",
        coachAdvice: "Advice 1",
        exerciseBlocks: [exerciseBlock],
      );
    });

    test('should create Session correctly', () {
      expect(session.id, "s1");
      expect(session.title, "Session 1");
      expect(session.sessionIndex, 1);
      expect(session.duration, const Duration(minutes: 30));
      expect(session.distance, 5.0);
      expect(session.difficulty, 2);
      expect(session.type, SessionType.road);
      expect(session.status, SessionStatus.todo);
      expect(session.description, "Description 1");
      expect(session.coachAdvice, "Advice 1");
      expect(session.exerciseBlocks.length, 1);
      expect(session.exerciseBlocks.first, exerciseBlock);
    });

    test('two Sessions with same values should be equal', () {
      final session2 = Session(
        id: "s1",
        title: "Session 1",
        sessionIndex: 1,
        duration: const Duration(minutes: 30),
        distance: 5.0,
        difficulty: 2,
        type: SessionType.road,
        status: SessionStatus.todo,
        description: "Description 1",
        coachAdvice: "Advice 1",
        exerciseBlocks: [exerciseBlock],
      );

      expect(session, session2);
    });

    test('toSessionType extension returns correct enum', () {
      expect("road".toSessionType(), SessionType.road);
      expect("trail".toSessionType(), SessionType.trail);
      expect("invalid".toSessionType(), SessionType.road);
    });

    test('toSessionStatus extension returns correct enum', () {
      expect("todo".toSessionStatus(), SessionStatus.todo);
      expect("done".toSessionStatus(), SessionStatus.done);
      expect("skipped".toSessionStatus(), SessionStatus.skipped);
      expect("invalid".toSessionStatus(), SessionStatus.todo);
    });
  });
}
