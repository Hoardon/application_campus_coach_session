import 'package:application_campus_coach_session/src/core/utils/const_utils.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/header_session_stats.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/section_title.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_badge_type.dart';
import 'package:flutter/material.dart';

class SessionListCard extends StatelessWidget {
  final Session session;

  const SessionListCard({required this.session, super.key});

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
                Expanded(
                  child: SectionTitle(title: 'Séance ${session.sessionIndex}'),
                ),
                SessionBadgeType(label: session.status.getLabel()),
                SizedBox(width: Spacing.m),
                const SessionBadgeType(label: 'COMPETITION'),
              ],
            ),
            SizedBox(height: Spacing.xxs),
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
          ],
        ),
      ),
    );
  }
}
