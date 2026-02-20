import 'package:application_campus_coach_session/src/core/utils/const_utils.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/coach_avatar.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/header_session_stats.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/section_title.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_badge_type.dart';
import 'package:flutter/material.dart';

class SessionAdvice extends StatelessWidget {
  final Session session;

  const SessionAdvice({required this.session, super.key});

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
              spacing: Spacing.s,
              children: [
                CoachAvatar(imageUrl: 'assets/images/coach.png'),
                Text(
                  'Coach | Tristan',
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: .bold),
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
              ],
            ),
            Text(session.coachAdvice),
          ],
        ),
      ),
    );
  }
}
