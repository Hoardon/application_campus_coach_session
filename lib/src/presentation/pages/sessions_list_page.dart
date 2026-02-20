import 'package:application_campus_coach_session/src/core/presentation/ui_state.dart';
import 'package:application_campus_coach_session/src/core/routing/routing.dart';
import 'package:application_campus_coach_session/src/core/utils/const_utils.dart';
import 'package:application_campus_coach_session/src/presentation/controllers/sessions_controller.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/action_button.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionsListPage extends GetView<SessionsController> {
  const SessionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppButtonAction(
        onTap: () {
          final isDark = Get.isDarkMode;
          Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
        },
        icon: Icon(Icons.light_mode_rounded),
      ),
      body: Obx(() {
        final controller = Get.find<SessionsController>();
        final state = controller.state.value;
        return switch (state) {
          UiLoading() => CircularProgressIndicator(),
          UiSuccess() => Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.m),
              child: ListView.separated(
                itemCount: state.data.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: Spacing.m),
                itemBuilder: (context, index) {
                  final session = state.data[index];

                  return GestureDetector(
                    onTap: () => Get.toNamed(
                      AppRouting.sessionDetails,
                      parameters: {'id': session.id},
                    ),
                    child: SessionListCard(session: session),
                  );
                },
              ),
            ),
          ),
          UiError() => Text(state.message),
        };
      }),
    );
  }
}
