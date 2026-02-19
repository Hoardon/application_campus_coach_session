import 'package:flutter_test/flutter_test.dart';
import 'package:application_campus_coach_session/src/data/datasources/session_local_data_source.dart';
import 'package:application_campus_coach_session/src/data/models/session_model.dart';

void main() {
  late SessionLocalDataSourceImpl dataSource, dataSource2, dataSource3;

  const mockJson = '''
  [
    {
      "id": "session_001",
      "title": "Test Session",
      "sessionIndex": 1,
      "duration": 1800,
      "distance": 5.0,
      "difficulty": 2,
      "type": "road",
      "status": "todo",
      "description": "Test description",
      "coachAdvice": "Test advice",
      "exerciseBlocks": []
    }
  ]
  ''';

  const mockJson2 = '''
  [
    {
      "id": "session_001",
      "title": "Test Session",
      "sessionIndex": 1,
      "duration": 1800,
      "distance": 5.0,
      "difficulty": 2,
      "type": "road",
      "status": "todo",
      "description": "Test description",
      "coachAdvice": "Test advice",
      "exerciseBlocks": []
    },
    {
      "id": "session_002",
      "title": "Test Session 2",
      "sessionIndex": 2,
      "duration": 1800,
      "distance": 5.0,
      "difficulty": 2,
      "type": "road",
      "status": "todo",
      "description": "Test description 2",
      "coachAdvice": "Test advice 2",
      "exerciseBlocks": []
    }
  ]
  ''';

  setUp(() {
    dataSource = SessionLocalDataSourceImpl(loader: (_) async => mockJson);
    dataSource2 = SessionLocalDataSourceImpl(loader: (_) async => mockJson2);
    dataSource3 = SessionLocalDataSourceImpl(loader: (_) async => '[]');
  });

  test('should return list of SessionModel when JSON is valid', () async {
    final result = await dataSource.getSessions();

    expect(result, isA<List<SessionModel>>());
    expect(result.length, 1);
    expect(result.first.id, "session_001");
    expect(result.first.title, "Test Session");
  });

  setUp(() {});

  test(
    'should return list of SessionModel of size 2 when JSON is valid',
    () async {
      final result = await dataSource2.getSessions();

      expect(result, isA<List<SessionModel>>());
      expect(result.length, 2);
      expect(result[0].id, "session_001");
      expect(result[1].id, "session_002");
      expect(result[0].title, "Test Session");
      expect(result[1].title, "Test Session 2");
    },
  );

  test(
    'should return list of SessionModel of size 0 when JSON is valid',
    () async {
      final result = await dataSource3.getSessions();

      expect(result, isA<List<SessionModel>>());
      expect(result.length, 0);
    },
  );
}
