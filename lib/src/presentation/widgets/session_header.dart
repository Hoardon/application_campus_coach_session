import 'package:application_campus_coach_session/src/core/utils/const_utils.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/header_session_stats.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_badge_type.dart';
import 'package:flutter/material.dart';

class SessionHeader extends StatelessWidget {
  final Session session;

  const SessionHeader({required this.session, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 1,
      color: theme.colorScheme.surface,
      borderRadius: const .all(.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.m),
        child: Column(
          spacing: Spacing.m,
          children: [
            Row(
              children: [
                Expanded(child: _HeaderTitle(theme: theme)),
                const SessionBadgeType(label: 'COMPETITION'),
              ],
            ),
            Row(
              spacing: Spacing.m,
              children: [
                Expanded(child: HeaderSessionStats.time(session: session)),
                Container(height: 50, width: 1, color: theme.dividerColor),
                Expanded(child: HeaderSessionStats.distance(session: session)),
                Container(height: 50, width: 1, color: theme.dividerColor),
                Expanded(
                  child: HeaderSessionStats.difficulty(session: session),
                ),
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: theme.dividerColor,
            ),
            Text(session.description),
          ],
        ),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text('Séance 1 sur 3', style: theme.textTheme.titleMedium);
  }
}
