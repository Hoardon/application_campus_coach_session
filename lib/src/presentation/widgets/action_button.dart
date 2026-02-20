import 'package:flutter/material.dart';

class AppButtonAction extends StatelessWidget {
  static const size = 48.0;

  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final Widget icon;

  const AppButtonAction({
    required this.onTap,
    required this.icon,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        margin: margin,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20),
        ),
        child: icon,
      ),
    );
  }
}
