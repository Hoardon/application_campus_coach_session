import 'package:application_campus_coach_session/src/presentation/widgets/session_badge_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SessionBadgeType Widget', () {
    testWidgets('displays the provided label', (WidgetTester tester) async {
      const labelText = 'Route';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: SessionBadgeType(label: labelText)),
        ),
      );

      expect(find.text(labelText), findsOneWidget);

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('renders with correct padding and decoration', (
      WidgetTester tester,
    ) async {
      const labelText = 'Trail';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: SessionBadgeType(label: labelText)),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));

      expect(container.decoration, isA<BoxDecoration>());

      final boxDecoration = container.decoration as BoxDecoration;
      expect(boxDecoration.borderRadius, isNotNull);
      expect(boxDecoration.color, isNotNull);
    });
  });
}
