import 'package:application_campus_coach_session/src/core/presentation/ui_state.dart';
import 'package:application_campus_coach_session/src/core/utils/const_utils.dart';
import 'package:application_campus_coach_session/src/presentation/controllers/session_details_controller.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/action_button.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/app_header_title.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/background_image.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/bottom_actions.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_advice.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_body.dart';
import 'package:application_campus_coach_session/src/presentation/widgets/session_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionDetailsPage extends GetView<SessionDetailsController> {
  const SessionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const collapsedBarHeight = kToolbarHeight;
    const expandedBarHeight = 200.0;

    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: expandedBarHeight,
                collapsedHeight: collapsedBarHeight,
                pinned: false,
                floating: false,
                backgroundColor: Colors.transparent,
                leadingWidth: kToolbarHeight,
                toolbarHeight: kToolbarHeight - 8,
                leading: AppButtonAction(
                  onTap: () => Get.back(),
                  margin: EdgeInsets.only(left: 8),
                  icon: Icon(Icons.clear),
                ),
                actions: [
                  AppButtonAction(
                    onTap: () {
                      final isDark = Get.isDarkMode;
                      Get.changeThemeMode(
                        isDark ? ThemeMode.light : ThemeMode.dark,
                      );
                    },
                    margin: EdgeInsets.only(right: 8),
                    icon: Icon(Icons.light_mode_rounded),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.only(right: Spacing.xxl),
                    child: Obx(() {
                      final state = controller.state.value;

                      return switch (state) {
                        UiLoading() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        UiError(message: final message) => Center(
                          child: Text("Erreur: $message"),
                        ),
                        UiSuccess(data: final session) => AppHeaderTitle(
                          title: session.title,
                        ),
                      };
                    }),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Material(
                  elevation: 4,
                  color: theme.colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(Spacing.m),
                    child: Obx(() {
                      final state = controller.state.value;

                      return switch (state) {
                        UiLoading() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        UiError(message: final message) => Center(
                          child: Text("Erreur: $message"),
                        ),
                        UiSuccess(data: final session) => Column(
                          spacing: Spacing.m,
                          children: [
                            SessionHeader(session: session),
                            SessionBody(session: session),
                            SessionAdvice(session: session),
                            BottomActions(),
                          ],
                        ),
                      };
                    }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
