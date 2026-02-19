import 'package:application_campus_coach_session/src/data/repositories/session_repository.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';

class GetSessions {
  final SessionRepository repository;

  GetSessions(this.repository);

  Future<List<Session>> call() async {
    return await repository.getSessions();
  }
}