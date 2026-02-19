import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SessionDetailsPage extends StatelessWidget {
  const SessionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Text('SessionDetailsPage'),
          ElevatedButton(
            onPressed: () {
              final isDark = Get.isDarkMode;
              Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
            },
            child: Text('Toggle theme'),
          ),
        ],
      ),
    );
  }
}
