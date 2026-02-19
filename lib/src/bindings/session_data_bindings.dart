import 'package:application_campus_coach_session/src/data/datasources/session_local_data_source.dart';
import 'package:application_campus_coach_session/src/data/repositories/mocks_session_repository.dart';
import 'package:application_campus_coach_session/src/data/repositories/session_repository.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SessionDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionLocalDataSource>(() => SessionLocalDataSourceImpl());

    Get.lazyPut<SessionRepository>(
      () => MocksSessionRepository(
        dataSource: Get.find<SessionLocalDataSource>(),
      ),
    );
  }
}
