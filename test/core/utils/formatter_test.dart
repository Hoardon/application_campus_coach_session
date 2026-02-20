import 'package:application_campus_coach_session/src/core/utils/formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DurationFormatter', () {
    test('should format minutes only', () {
      final duration = Duration(minutes: 46);

      expect(duration.toHourMinFormat(), '46min');
    });

    test('should format minutes and seconds when no hours', () {
      final duration = Duration(minutes: 3, seconds: 5);

      expect(duration.toHourMinFormat(), '3min05');
    });

    test('should format hours and minutes', () {
      final duration = Duration(hours: 1, minutes: 10);
      final duration2 = Duration(hours: 5, minutes: 45, seconds: 18);

      expect(duration.toHourMinFormat(), '1h10');
      expect(duration2.toHourMinFormat(), '5h45');
    });

    test('should return seconds when minutes == 0 and hours > 0', () {
      final duration = Duration(hours: 1, seconds: 30);

      expect(duration.toHourMinFormat(), '30sec');
    });

    test('should format zero duration', () {
      final duration = Duration.zero;

      expect(duration.toHourMinFormat(), '0min');
    });
  });

    group('PaceFormatter', () {
    test('should format minutes and seconds', () {
      final duration = Duration(minutes: 5, seconds: 3);

      expect(duration.toPaceFormat(), '5:03');
    });

    test('should format double digit minutes', () {
      final duration = Duration(minutes: 12, seconds: 45);

      expect(duration.toPaceFormat(), '12:45');
    });

    test('should format hours, minutes and seconds', () {
      final duration = Duration(hours: 1, minutes: 5, seconds: 9);

      expect(duration.toPaceFormat(), '1:05:09');
    });

    test('should format zero duration', () {
      final duration = Duration.zero;

      expect(duration.toPaceFormat(), '0:00');
    });

    test('should format seconds only', () {
      final duration = Duration(seconds: 8);

      expect(duration.toPaceFormat(), '0:08');
    });
  });

  group('DistanceFormatter', () {
    test('should round to 1 decimal', () {
      final distance = 10.456;

      expect(distance.toKmFormat(), 10.5);
    });

    test('should keep one decimal if already correct', () {
      final distance = 5.2;

      expect(distance.toKmFormat(), 5.2);
    });

    test('should round down correctly', () {
      final distance = 3.14;

      expect(distance.toKmFormat(), 3.1);
    });
  });
}
