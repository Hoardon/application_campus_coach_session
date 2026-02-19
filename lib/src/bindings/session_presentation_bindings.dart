import 'package:application_campus_coach_session/src/domain/usecases/get_session_details_by_id.dart';
import 'package:application_campus_coach_session/src/domain/usecases/get_sessions.dart';
import 'package:application_campus_coach_session/src/presentation/controllers/session_details_controller.dart';
import 'package:application_campus_coach_session/src/presentation/controllers/sessions_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SessionPresentationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionsController>(
      () => SessionsController(getSessionsUseCase: Get.find<GetSessions>()),
    );
    Get.lazyPut<SessionDetailsController>(
      () => SessionDetailsController(
        getSessionDetailsById: Get.find<GetSessionDetailsById>(),
      ),
    );
  }
}
