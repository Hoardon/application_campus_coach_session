import 'package:application_campus_coach_session/src/core/presentation/ui_state.dart';
import 'package:application_campus_coach_session/src/presentation/controllers/session_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SessionDetailsPage extends GetView<SessionDetailsController> {
  const SessionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Text('SessionDetailsPage'),
          Obx(() {
            final state = controller.state.value;

            return switch (state) {
              UiLoading() => const Center(child: CircularProgressIndicator()),
              UiError(message: final message) => Center(
                child: Text("Erreur: $message"),
              ),
              UiSuccess(data: final session) => Column(
                children: [Text(session.title), Text(session.description)],
              ),
              _ => const SizedBox(),
            };
          }),
        ],
      ),
    );
  }
}
