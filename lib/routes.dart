import 'package:slot_booking1/screens_packages.dart';

const String splashRoute = '/splashscreen';
const String login = '/entryscreen/login';
const String register = '/entryscreen';
const String category = '/category_selection/vehicle_category';
const String fourdashboards= '/4_wheeler_parking/4_wheeler_dashboards';
const String fourslotbooking = '/4_wheeler_parking/slot_booking';
const String twodashboards = '/2_wheeler_parking/2_wheeler_dashboards';
const String twoslotbooking = '/2_wheeler_parking/slot_booking';


class RouterConfig{

  static Route<dynamic>? generateRoute(RouteSettings settings){
    final arguments = settings.arguments;
    switch (settings.name){
      case splashRoute:
        return MaterialPageRoute(builder: (_)=> SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_)=> Login());
      case register:
        return MaterialPageRoute(builder: (_)=> Register());
      case category:
        return MaterialPageRoute(builder: (_)=> Vehicle_Category() );
      case fourdashboards:
        return MaterialPageRoute(builder: (_)=> Four_Dasboards());
      case fourslotbooking:
        return MaterialPageRoute(builder: (_)=> FourSlot());
      case twodashboards:
        return MaterialPageRoute(builder: (_)=> Two_Dashboards());
      case twoslotbooking:
        return MaterialPageRoute(builder: (_)=> TwoSlot());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: SizedBox()),
            ));


    }
  }
}
