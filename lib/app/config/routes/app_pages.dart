import 'package:get/get.dart';
import 'package:mini_post_video/app/main_feature/presentation/binding/main_binding.dart';
import 'package:mini_post_video/app/main_feature/presentation/screens/main_screen.dart';
import 'package:mini_post_video/splash_screen.dart';

part './app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
  ];
}
