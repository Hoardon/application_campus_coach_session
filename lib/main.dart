import 'package:application_campus_coach_session/src/app.dart';
import 'package:application_campus_coach_session/src/core/utils/error_handler.dart';
import 'package:application_campus_coach_session/src/services/firebase_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseService.initializeFirebase();
  registerErrorHandler();
  runApp(const MyApp());
}
