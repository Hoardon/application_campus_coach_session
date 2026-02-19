import 'package:application_campus_coach_session/src/domain/entities/session.dart';

abstract class SessionRepository {
  Future<List<Session>> getSessions();
  Future<Session> getSessionDetailsById({required String id});
}