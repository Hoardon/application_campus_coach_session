import 'package:application_campus_coach_session/src/bindings/session_data_bindings.dart';
import 'package:application_campus_coach_session/src/bindings/session_domain_bindings.dart';
import 'package:application_campus_coach_session/src/bindings/session_presentation_bindings.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SessionsBinding extends Bindings {
  @override
  void dependencies() {
    SessionDataBinding().dependencies();
    SessionDomainBinding().dependencies();
    SessionPresentationBindings().dependencies();
  }
}
