import 'package:application_campus_coach_session/src/data/repositories/session_repository.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';

class GetSessionById {
  final SessionRepository repository;

  GetSessionById(this.repository);

  Future<Session> call({required String id}) async {
    return await repository.getSessionDetailsById(id: id);
  }
}
