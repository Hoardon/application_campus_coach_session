import 'package:flutter/material.dart';

class AppHeaderTitle extends StatelessWidget {
  final String title;

  const AppHeaderTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      title,
      maxLines: 2,
      overflow: .ellipsis,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w900,
        color: Colors.white,
      ),
    );
  }
}
