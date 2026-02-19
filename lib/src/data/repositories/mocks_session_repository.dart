import 'package:application_campus_coach_session/src/data/datasources/session_local_data_source.dart';
import 'package:application_campus_coach_session/src/data/models/session_model.dart';
import 'package:application_campus_coach_session/src/data/repositories/session_repository.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';

class MocksSessionRepository extends SessionRepository {
  final SessionLocalDataSource dataSource;

  MocksSessionRepository({required this.dataSource});

  @override
  Future<List<Session>> getSessions() async {
    final models = await dataSource.getSessions();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<Session> getSessionDetailsById({required String id}) async {
    final models = await dataSource.getSessions();
    final model = models.firstWhere((element) => element.id == id);
    return model.toEntity();
  }
}
