import 'package:application_campus_coach_session/src/core/utils/const_utils.dart';
import 'package:flutter/material.dart';

class ExerciseBadgeType extends StatelessWidget {
  final String label;

  const ExerciseBadgeType({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const .all(.circular(20)),
        color: theme.dividerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.s,
          vertical: Spacing.xxs,
        ),
        child: Text(label.toUpperCase(), style: theme.textTheme.labelSmall),
      ),
    );
  }
}
