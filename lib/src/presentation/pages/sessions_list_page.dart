import 'package:application_campus_coach_session/src/core/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionsListPage extends StatelessWidget {
  const SessionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Text('SessionsListPage @'),
          ElevatedButton(
            onPressed: () {
              final isDark = Get.isDarkMode;
              Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
            },
            child: Text('Toggle theme'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRouting.sessionDetails);
            },
            child: Text('go to details'),
          ),
        ],
      ),
    );
  }
}
