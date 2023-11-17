import 'package:device_preview/device_preview.dart';
import 'package:slot_booking1/routes.dart' as routes;
import 'package:slot_booking1/routes.dart';

import 'screens_packages.dart';

void main() {
  runApp(const MyApp());
  // runApp( DevicePreview(
  //   builder: (context) => MyApp(), // Wrap your app
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      getPages: getPages,
    );
  }
}
