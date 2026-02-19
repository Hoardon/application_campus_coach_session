import 'package:application_campus_coach_session/src/core/presentation/ui_state.dart';
import 'package:application_campus_coach_session/src/core/routing/routing.dart';
import 'package:application_campus_coach_session/src/presentation/controllers/sessions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionsListPage extends GetView<SessionsController> {
  const SessionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Text('SessionsListPage @'),
          Obx(() {
            final controller = Get.find<SessionsController>();
            final state = controller.state.value;
            return switch (state) {
              UiLoading() => CircularProgressIndicator(),
              UiSuccess() => Expanded(
                child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) =>
                      Text(state.data[index].toString()),
                ),
              ),
              UiError() => Text(state.message),
            };
          }),
          ElevatedButton(
            onPressed: () {
              final isDark = Get.isDarkMode;
              Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
            },
            child: Text('Toggle theme'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(
                AppRouting.sessionDetails,
                parameters: {'id': 'session_001'},
              );
            },
            child: Text('go to details'),
          ),
        ],
      ),
    );
  }
}
