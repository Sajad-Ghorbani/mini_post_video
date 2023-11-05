import 'package:mini_post_video/app/core/resources/data_state.dart';
import 'package:mini_post_video/app/main_feature/domain/entities/meta_data_entity.dart';
import 'package:mini_post_video/app/main_feature/domain/entities/video_entity.dart';

abstract interface class VideoRepository {
  Future<DataState<({List<VideoEntity> videos, MetaDataEntity metaData})>>
      getAllVideo(int? page);

  Future<DataState<VideoEntity>> getVideo(int id);
}
