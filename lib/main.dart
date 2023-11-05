import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_post_video/app/config/routes/app_pages.dart';
import 'package:mini_post_video/app/core/service/services.dart';
import 'package:mini_post_video/splash_screen.dart';

void main()async {
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => AppServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      initialRoute: Routes.initial,
    );
  }
}