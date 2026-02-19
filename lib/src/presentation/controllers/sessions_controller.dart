import 'package:application_campus_coach_session/src/core/presentation/ui_state.dart';
import 'package:application_campus_coach_session/src/domain/entities/session.dart';
import 'package:application_campus_coach_session/src/domain/usecases/get_sessions.dart';
import 'package:get/get.dart';

class SessionsController extends GetxController {
  final GetSessions getSessionsUseCase;

  SessionsController({required this.getSessionsUseCase});

  final state = Rx<UiState<List<Session>>>(const UiLoading());

  @override
  void onInit() {
    super.onInit();
    loadSessions();
  }

  Future<void> loadSessions() async {
    state.value = const UiLoading();
    try {
      state.value = UiSuccess(await getSessionsUseCase());
    } catch (e) {
      state.value = UiError(e.toString());
    }
  }
}
