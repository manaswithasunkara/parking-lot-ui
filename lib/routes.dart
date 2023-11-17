import 'package:slot_booking1/screens/4_wheeler_parking/slot_booking4.dart';
import 'package:slot_booking1/screens_packages.dart';
class Routes {
  static String splashRoute = '/splashscreen';
  static String login = '/login';
  static String register = '/register';
  static String category = '/vehicle_category';
  static String fourdashboards = '/4_wheeler_dashboards';
  static String fourslotbooking = '/slot_booking4';
  static String twodashboards = '/2_wheeler_dashboards';
  static String twoslotbooking = '/slot_booking2';
}


/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(
    name: Routes.splashRoute,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: Routes.register,
    page: () => const Register(),
  ),
  GetPage(
    name: Routes.category,
    page: () => const Vehicle_Category(),
  ),
  GetPage(
    name: Routes.fourdashboards,
    page: () => const Four_Dasboards(),
  ),
  GetPage(
    name: Routes.fourslotbooking,
    page: () => const FourSlot(),
  ),
  GetPage(
    name: Routes.twodashboards,
    page: () => const Two_Dashboards(),
  ),
  GetPage(
    name: Routes.twoslotbooking,
    page: () => const TwoSlot(),
  ),
];