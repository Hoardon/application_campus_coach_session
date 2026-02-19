import 'package:application_campus_coach_session/src/core/routing/routing.dart';
import 'package:application_campus_coach_session/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.native,
      initialRoute: AppRouting.sessionsList,
      getPages: AppRouting.routes,
    );
  }
}
