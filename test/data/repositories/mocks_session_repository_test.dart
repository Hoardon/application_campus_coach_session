import 'package:application_campus_coach_session/src/data/repositories/mocks_session_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/data/datasources/session_local_data_source.dart';
import 'package:application_campus_coach_session/src/data/models/session_model.dart';
import 'package:application_campus_coach_session/src/data/models/exercise_block_model.dart';
import 'package:application_campus_coach_session/src/data/models/exercise_model.dart';

class FakeSessionLocalDataSource implements SessionLocalDataSource {
  int callCount = 0;

  @override
  Future<List<SessionModel>> getSessions() async {
    callCount++;
    return [
      SessionModel(
        id: "s1",
        title: "Session 1",
        sessionIndex: 1,
        duration: 1800,
        distance: 5.0,
        difficulty: 2,
        type: "road",
        status: "todo",
        description: "Desc 1",
        coachAdvice: "Advice 1",
        exerciseBlocks: [
          ExerciseBlockModel(
            exercises: [
              ExerciseModel(
                paceName: "Endurance",
                zone: 2,
                duration: 600,
                pace: 360,
              ),
            ],
            repeat: 2,
            blockType: "warmUp",
          ),
        ],
      ),
      SessionModel(
        id: "s2",
        title: "Session 2",
        sessionIndex: 2,
        duration: 1200,
        distance: 3.5,
        difficulty: 3,
        type: "trail",
        status: "done",
        description: "Desc 2",
        coachAdvice: "Advice 2",
        exerciseBlocks: [],
      ),
    ];
  }
}

void main() {
  group('MocksSessionRepository', () {
    late FakeSessionLocalDataSource fakeDataSource;
    late MocksSessionRepository repository;

    setUp(() {
      fakeDataSource = FakeSessionLocalDataSource();
      repository = MocksSessionRepository(dataSource: fakeDataSource);
    });

    test('getSessions returns sessions and caches them', () async {
      final firstCall = await repository.getSessions();

      expect(firstCall.length, 2);
      expect(firstCall.first.id, "s1");

      final secondCall = await repository.getSessions();
      expect(secondCall, firstCall); //
      expect(fakeDataSource.callCount, 1);
    });

    test('getSessionDetailsById returns correct session from cache', () async {
      await repository.getSessions();
      final session = await repository.getSessionDetailsById(id: "s2");

      expect(session.id, "s2");
      expect(session.title, "Session 2");
    });

    test('getSessionDetailsById calls getSessions if cache is empty', () async {
      final session = await repository.getSessionDetailsById(id: "s1");

      expect(session.id, "s1");
      expect(fakeDataSource.callCount, 1);
    });
  });
}
