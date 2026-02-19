import 'package:application_campus_coach_session/src/presentation/pages/session_details_page.dart';
import 'package:application_campus_coach_session/src/presentation/pages/sessions_list_page.dart';
import 'package:get/route_manager.dart';

class AppRouting {
  static const sessionsList = '/sessions-list';
  static const sessionDetails = '/session-details';

  static final routes = [
    GetPage(name: sessionsList, page: () => SessionsListPage()),
    GetPage(
      name: sessionDetails,
      transition: Transition.downToUp,
      page: () => SessionDetailsPage(),
    ),
  ];
}
