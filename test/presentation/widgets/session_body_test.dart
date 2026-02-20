import 'package:application_campus_coach_session/src/domain/entities/exercise_block.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/exercise_block_widget.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SessionBody Widget', () {
    final warmUpBlock = ExerciseBlock(
      exercises: [],
      repeat: 1,
      blockType: BlockType.warmUp,
    );

    final sprintBlock = ExerciseBlock(
      exercises: [],
      repeat: 5,
      blockType: BlockType.warmUp,
    );

    final testSession = Session(
      id: '1',
      title: 'Morning Run',
      sessionIndex: 0,
      duration: const Duration(minutes: 45),
      distance: 10.5,
      difficulty: 3,
      type: SessionType.road,
      status: SessionStatus.todo,
      description: 'A 10km run around the park',
      coachAdvice: 'Remember to stretch before starting.',
      exerciseBlocks: [warmUpBlock, sprintBlock],
    );

    testWidgets('renders header, badge, exercise blocks, and button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: SessionBody(session: testSession)),
        ),
      );

      expect(find.text('INSTRUCTION'), findsOneWidget);

      expect(find.text('ROUTE'), findsOneWidget);

      expect(
        find.byType(ExerciseBlockWidget),
        findsNWidgets(testSession.exerciseBlocks.length),
      );

      expect(find.text("Démarrer l'activité"), findsOneWidget);
    });
  });
}
