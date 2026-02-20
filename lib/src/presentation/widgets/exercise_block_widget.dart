import 'package:application_campus_coach_session/src/core/utils/const_utils.dart';
import 'package:application_campus_coach_session/src/domain/entities/exercise_block.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/exercise_badge_type.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/exercise_tile.dart';
import 'package:flutter/material.dart';

class ExerciseBlockWidget extends StatelessWidget {
  const ExerciseBlockWidget({super.key, required this.exerciseBlock});

  final ExerciseBlock exerciseBlock;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = exerciseBlock.blockType.getLabel();
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: label.isNotEmpty ? Spacing.s : 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: .all(Radius.circular(20)),
              border: Border.all(color: theme.dividerColor),
            ),
            child: ClipRRect(
              borderRadius: .all(Radius.circular(17)),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: exerciseBlock.repeat > 1 ? 60 : 0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(exerciseBlock.exercises.length, (
                        index,
                      ) {
                        final exercise = exerciseBlock.exercises[index];
                        return ExerciseTile(exercise: exercise);
                      }),
                    ),
                  ),
                  if (exerciseBlock.repeat > 1)
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(color: theme.dividerColor),
                          alignment: Alignment.center,
                          child: Text(
                            'x${exerciseBlock.repeat}',
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (label.isNotEmpty)
          Positioned(
            top: 0,
            left: Spacing.l,
            child: ExerciseBadgeType(label: exerciseBlock.blockType.getLabel()),
          ),
      ],
    );
  }
}
