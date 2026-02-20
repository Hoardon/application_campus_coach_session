import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/bottom_actions.dart';
import 'package:flutter/material.dart';

class SessionBody extends StatelessWidget {
  final Session session;

  const SessionBody({required this.session, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 1,
      color: theme.colorScheme.surface,
      borderRadius: const .all(.circular(20)),
      child: BottomActions(),
    );
  }
}
