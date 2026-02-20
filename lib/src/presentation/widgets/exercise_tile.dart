import 'package:application_campus_coach_session/src/core/utils/formatter.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      minLeadingWidth: 0,
      leading: Container(
        width: 3,
        decoration: BoxDecoration(
          color: exercise.getZoneColor(),
          borderRadius: .all(.circular(20)),
        ),
      ),
      title: Text(exercise.paceName, style: theme.textTheme.bodySmall),
      subtitle: RichText(
        text: TextSpan(
          text: exercise.duration.toHourMinFormat(),
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: ' à ', style: theme.textTheme.bodySmall),
            TextSpan(
              text: exercise.pace.toPaceFormat(),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: ' /km', style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
