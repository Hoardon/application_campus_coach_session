import 'package:application_campus_coach_session/src/core/utils/formatter.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:flutter/material.dart';

enum HeaderSessionStatsType { time, distance, difficulty }

class HeaderSessionStats extends StatelessWidget {
  final HeaderSessionStatsType type;
  final Session session;

  const HeaderSessionStats.time({required this.session, super.key})
    : type = .time;
  const HeaderSessionStats.distance({required this.session, super.key})
    : type = .distance;
  const HeaderSessionStats.difficulty({required this.session, super.key})
    : type = .difficulty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .start,
      mainAxisAlignment: .start,
      children: [
        Text(switch (type) {
          HeaderSessionStatsType.time => 'Durée',
          HeaderSessionStatsType.distance => 'Distance',
          HeaderSessionStatsType.difficulty => 'Difficulté',
        }),
        switch (type) {
          HeaderSessionStatsType.time => RichText(
            text: TextSpan(
              text: session.duration.toHourMinFormat().toString(),
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: .bold),
              children: <TextSpan>[
                TextSpan(text: ' min', style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          HeaderSessionStatsType.distance => RichText(
            text: TextSpan(
              text: session.distance.toKmFormat().toString(),
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: .bold),
              children: <TextSpan>[
                TextSpan(text: ' km', style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          HeaderSessionStatsType.difficulty => Row(
            children: List.generate(
              5,
              (index) => Expanded(
                child: Icon(
                  Icons.bolt_rounded,
                  color: theme.colorScheme.onSurface.withValues(
                    alpha: index <= session.difficulty - 1 ? 1 : 0.5,
                  ),
                ),
              ),
            ),
          ),
        },
      ],
    );
  }
}
