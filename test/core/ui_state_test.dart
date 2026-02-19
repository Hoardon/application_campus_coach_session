import 'package:application_campus_coach_session/src/core/presentation/ui_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UiState', () {
    test('UiLoading should be instance of UiState', () {
      final state = UiLoading<int>();
      expect(state, isA<UiState<int>>());
    });

    test('UiSuccess should store data correctly', () {
      final state = UiSuccess<String>('Hello');

      expect(state, isA<UiState<String>>());
      expect(state.data, 'Hello');
    });

    test('UiError should store message correctly', () {
      final state = UiError<double>('Something went wrong');

      expect(state, isA<UiState<double>>());
      expect(state.message, 'Something went wrong');
    });

    test('UiSuccess and UiError generics work correctly', () {
      final success = UiSuccess<List<int>>([1, 2, 3]);
      final error = UiError<Map<String, String>>('Error map');

      expect(success.data, [1, 2, 3]);
      expect(error.message, 'Error map');
    });
  });
}
