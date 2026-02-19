import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
abstract class Exercise with _$Exercise {
  const factory Exercise({
    required String paceName,
    required int zone,
    required int duration,
    required int pace,
  }) = _Exercise;
}
