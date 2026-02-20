import 'package:get/utils.dart';

extension DurationFormatter on Duration {
  String toHourMinFormat() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    if (hours == 0) {
      if (seconds == 0) return '${minutes}min';
      final secondsStr = seconds.toString().padLeft(2, '0');
      return '${minutes}min$secondsStr';
    }

    if (minutes == 0 && hours == 0) {
      return '${seconds}sec';
    }

    final minutesStr = minutes.toString().padLeft(2, '0');
    return '${hours}h$minutesStr';
  }
}

extension PaceFormatter on Duration {
  String toPaceFormat() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    final secondsStr = seconds.toString().padLeft(2, '0');

    if (hours > 0) {
      final minutesStr = minutes.toString().padLeft(2, '0');
      return '$hours:$minutesStr:$secondsStr';
    }

    return '$minutes:$secondsStr';
  }
}

extension DistanceFormatter on double {
  double toKmFormat() {
    return toPrecision(1);
  }
}
