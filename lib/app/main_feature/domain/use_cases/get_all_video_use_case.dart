import 'package:mini_post_video/app/core/resources/data_state.dart';
import 'package:mini_post_video/app/main_feature/domain/entities/meta_data_entity.dart';
import 'package:mini_post_video/app/main_feature/domain/entities/video_entity.dart';
import 'package:mini_post_video/app/main_feature/domain/repositories/video_repository.dart';

base class GetAllVideoUseCase {
  final VideoRepository _videoRepository;

  GetAllVideoUseCase(this._videoRepository);

  Future<DataState<({List<VideoEntity> videos, MetaDataEntity metaData})>>
      execute(int? page) {
    return _videoRepository.getAllVideo(page);
  }
}
