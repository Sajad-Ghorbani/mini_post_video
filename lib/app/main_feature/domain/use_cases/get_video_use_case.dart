import 'package:mini_post_video/app/core/resources/data_state.dart';
import 'package:mini_post_video/app/main_feature/domain/entities/video_entity.dart';
import 'package:mini_post_video/app/main_feature/domain/repositories/video_repository.dart';

base class GetVideoUseCase {
  final VideoRepository _videoRepository;

  GetVideoUseCase(this._videoRepository);

  Future<DataState<VideoEntity>> execute(int id) {
    return _videoRepository.getVideo(id);
  }
}
