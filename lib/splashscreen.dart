import 'package:flutter/services.dart';

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


    Future.delayed(const Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const Login()));
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
        child: Image.asset('images/WhatsApp Image 2023-11-03 at 21.32.36_124ab3d9.jpg'),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.splashBgColor,
      ),
    );
  }
}
