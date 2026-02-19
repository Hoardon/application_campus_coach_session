import 'dart:convert';
import 'package:application_campus_coach_session/src/data/models/session_model.dart';
import 'package:flutter/services.dart';

abstract class SessionLocalDataSource {
  Future<List<SessionModel>> getSessions();
}

class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  static const mocksPath = 'assets/mocks/sessions_mocks.json';

  @override
  Future<List<SessionModel>> getSessions() async {
    final String jsonString = await rootBundle.loadString(mocksPath);

    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((jsonItem) => SessionModel.fromJson(jsonItem)).toList();
  }
}
