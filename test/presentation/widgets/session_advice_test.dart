import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_advice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SessionAdvice Widget', () {
    // Create a test session
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
      exerciseBlocks: [],
    );

    testWidgets('renders coach name and advice text', (
      WidgetTester tester,
    ) async {
      // Build the widget inside MaterialApp for theming
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: SessionAdvice(session: testSession)),
        ),
      );

      // Verify the coach name is displayed
      expect(find.textContaining('Coach | Tristan'), findsOneWidget);

      // Verify the coach advice text is displayed
      expect(find.text(testSession.coachAdvice), findsOneWidget);

      // Verify the CoachAvatar image is displayed
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
