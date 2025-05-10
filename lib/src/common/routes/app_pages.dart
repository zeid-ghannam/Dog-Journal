import 'package:get/get.dart';

import '../../app_binding.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/splash_screen/splash_screen.dart';
import 'constant_routes.dart';

class AppPages {
  static const INITIAL = Routes.splash;

  static final routes = [
    // Splash screen --------------------------------------------------------------
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: AppBinding(),
    ),

    //intro screen --------------------------------------------------------------
    // GetPage(
    //   name: Routes.intro,
    //   page: () => const IntroScreen(),
    //   binding: AppBinding(),
    // ),
    //Home screen --------------------------------------------------------------
    GetPage(
      name: Routes.homeScreen,
      page: () =>  HomeScreen(),
      binding: AppBinding(),
    ),
  ];
}
