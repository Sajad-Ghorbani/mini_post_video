import 'package:get/get.dart';
import 'package:mini_post_video/app/main_feature/data/data_source/api_provider.dart';
import 'package:mini_post_video/app/main_feature/data/repositories/video_repository_impl.dart';
import 'package:mini_post_video/app/main_feature/domain/repositories/video_repository.dart';
import 'package:mini_post_video/app/main_feature/domain/use_cases/get_all_video_use_case.dart';
import 'package:mini_post_video/app/main_feature/domain/use_cases/get_video_use_case.dart';

class AppServices extends GetxService{

  Future<AppServices> init() async {

    ///inject api providers
    Get.put<ApiProvider>(ApiProvider());

    ///inject repositories
    Get.put<VideoRepository>(VideoRepositoryImpl(Get.find()));

    ///video use cases
    Get.put<GetAllVideoUseCase>(GetAllVideoUseCase(Get.find()));
    Get.put<GetVideoUseCase>(GetVideoUseCase(Get.find()));

    return this;
  }
}