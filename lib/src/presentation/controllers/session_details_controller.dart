import 'package:application_campus_coach_session/src/core/presentation/ui_state.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/domain/usecases/get_session_details_by_id.dart';
import 'package:get/get.dart';

class SessionDetailsController extends GetxController {
  final GetSessionDetailsById getSessionDetailsById;

  SessionDetailsController({required this.getSessionDetailsById});

  final state = Rx<UiState<Session>>(const UiLoading());

  @override
  void onInit() {
    super.onInit();
    final selectedSessionId = Get.parameters['id'] as String;
    loadSelectedSession(id: selectedSessionId);
  }

  Future<void> loadSelectedSession({required String id}) async {
    state.value = const UiLoading();
    try {
      state.value = UiSuccess(await getSessionDetailsById(id: id));
    } catch (e) {
      state.value = UiError(e.toString());
    }
  }
}
