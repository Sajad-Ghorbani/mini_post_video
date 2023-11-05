import 'package:get/get.dart';
import 'package:mini_post_video/app/main_feature/domain/use_cases/get_all_video_use_case.dart';
import 'package:mini_post_video/app/main_feature/domain/use_cases/get_video_use_case.dart';
import 'package:mini_post_video/app/main_feature/presentation/controller/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController(
      Get.find<GetAllVideoUseCase>(),
      Get.find<GetVideoUseCase>(),
    ));
  }
}
