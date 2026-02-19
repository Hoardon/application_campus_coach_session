import 'dart:ui';

import 'package:application_campus_coach_session/src/core/utils/logger.dart';
import 'package:application_campus_coach_session/src/services/firebase_service.dart';
import 'package:flutter/material.dart';

/// Error handler to display error on various exceptions and errors cases.
void registerErrorHandler() {
  // Display UI error on uncaught exception
  FlutterError.onError = (FlutterErrorDetails details) async {
    await FirebaseService.recordFlutterFatalError(details);
    FlutterError.presentError(details);
    Log.error(details.toString());
  };
  // * Handle platform and OS errors
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    FirebaseService.recordError(error, stack);
    Log.error('${error.toString()} ${stack.toString()}');
    return true;
  };
  // Display UI error on widget building failure
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const FittedBox(
            child: FittedBox(child: Text('Something unexpected occurred...')),
          ),
        ),
        body: Center(child: Text(details.toString())),
      ),
    );
  };
}
