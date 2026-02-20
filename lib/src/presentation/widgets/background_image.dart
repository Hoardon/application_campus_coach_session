
import 'package:application_campus_coach_session/src/core/utils/screen_size_utils.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  static const imgPath = 'assets/images/running.png';
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
      height: context.screenHeight / 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.withValues(alpha: 0.1),
        ),
      ),
    );
  }
}
