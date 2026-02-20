import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
abstract class Exercise with _$Exercise {
  const factory Exercise({
    required String paceName,
    required int zone,
    required Duration duration,
    required Duration pace,
  }) = _Exercise;
}

extension ExerciseExtension on Exercise {
  Color getZoneColor() {
    if (zone == 1) return Colors.yellow;
    if (zone == 2) return Colors.red;
    if (zone == 3) return Colors.blue;
    if (zone == 4) return Colors.greenAccent;
    if (zone == 5) return Colors.cyan;
    return Colors.brown;
  }
}
