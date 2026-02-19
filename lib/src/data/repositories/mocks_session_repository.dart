import 'package:application_campus_coach_session/src/data/datasources/session_local_data_source.dart';
import 'package:application_campus_coach_session/src/data/models/session_model.dart';
import 'package:application_campus_coach_session/src/data/repositories/session_repository.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';

class MocksSessionRepository extends SessionRepository {
  final SessionLocalDataSource dataSource;
  List<Session>? _cache;

  MocksSessionRepository({required this.dataSource});

  @override
  Future<List<Session>> getSessions() async {
    if (_cache != null) return _cache!;

    final models = await dataSource.getSessions();
    final sessionsList = models.map((e) => e.toEntity()).toList();
    _cache = sessionsList;
    return sessionsList;
  }

  @override
  Future<Session> getSessionDetailsById({required String id}) async {
    if (_cache != null) {
      return _cache!.firstWhere((element) => element.id == id);
    }

    final sessionsList = await getSessions();
    return sessionsList.firstWhere((element) => element.id == id);
  }
}
