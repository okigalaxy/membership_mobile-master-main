import 'package:get/get.dart';

import '../modules/history/history/bindings/history_binding.dart';
import '../modules/history/history/views/history_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/point/bindings/point_binding.dart';
import '../modules/point/views/point_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/qr_code/bindings/qr_binding.dart';
import '../modules/qr_code/views/qr_view.dart';
import '../modules/auth/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.history,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.point,
      page: () => PointView(),
      binding: PointBinding(),
    ),
    GetPage(
      name: _Paths.qr,
      page: () => QrView(),
      binding: QrBinding(),
    ),
  ];
}
