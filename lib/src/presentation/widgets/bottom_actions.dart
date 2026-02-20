import 'package:application_campus_coach_session/src/core/utils/const_utils.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class BottomActions extends StatelessWidget {
  const BottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Spacing.s,
      children: [
        Expanded(
          flex: 2,
          child: AppButton.secondary(
            label: 'Exporter',
            icon: Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ),
        Expanded(
          flex: 3,
          child: AppButton.primary(
            label: 'Valider la séance',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
