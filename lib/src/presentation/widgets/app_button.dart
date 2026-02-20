import 'package:flutter/material.dart';

enum AppButtonStyle { primary, secondary }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final AppButtonStyle style;

  const AppButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  }) : style = .primary;

  const AppButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  }) : style = .secondary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: switch (style) {
            AppButtonStyle.primary => theme.colorScheme.secondary,
            AppButtonStyle.secondary => theme.colorScheme.surfaceBright,
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: onPressed,
        icon: icon,
        label: Text(label, style: theme.textTheme.labelMedium),
      ),
    );
  }
}
