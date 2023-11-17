import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slot_booking1/routes.dart';

import 'screens_packages.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    start();
  }

  start(){
    Future.delayed(const Duration(seconds: 2), (){
      checkNavigation();
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.splashBgColor,
        child: Image.asset('images/WhatsApp Image 2023-11-03 at 21.32.36_124ab3d9.jpg'),
      ),
    );
  }

  Future<void> checkNavigation()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin')??false;
    if(isLogin) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.category, (Route<dynamic> route) => false);
    }else{
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.login, (Route<dynamic> route) => false);
    }
  }
}
