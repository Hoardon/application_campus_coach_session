import 'package:application_campus_coach_session/src/data/repositories/session_repository.dart';
import 'package:application_campus_coach_session/src/domain/usecases/get_session_details_by_id.dart';
import 'package:application_campus_coach_session/src/domain/usecases/get_sessions.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SessionDomainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetSessions>(() => GetSessions(Get.find<SessionRepository>()));
    Get.lazyPut<GetSessionDetailsById>(
      () => GetSessionDetailsById(Get.find<SessionRepository>()),
    );
  }
}
