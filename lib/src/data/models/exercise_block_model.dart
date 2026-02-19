import 'package:application_campus_coach_session/src/data/models/exercise_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/exercise_block.dart';

part 'exercise_block_model.freezed.dart';
part 'exercise_block_model.g.dart';

@freezed
abstract class ExerciseBlockModel with _$ExerciseBlockModel {
  const factory ExerciseBlockModel({
    required List<ExerciseModel> exercises,
    required int repeat,
    required String blockType,
  }) = _ExerciseBlockModel;

  factory ExerciseBlockModel.fromJson(Map<String, dynamic> json)
      => _$ExerciseBlockModelFromJson(json);
}

extension ExerciseBlockModelMapper on ExerciseBlockModel {
  ExerciseBlock toEntity() {
    return ExerciseBlock(
      exercises: exercises.map((e) => e.toEntity()).toList(),
      repeat: repeat,
      blockType: BlockType.values.byName(blockType),
    );
  }
}
