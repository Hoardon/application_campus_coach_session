import 'package:flutter/material.dart';

class CoachAvatar extends StatelessWidget {
  const CoachAvatar({super.key, required this.imageUrl, this.size = 60});

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
