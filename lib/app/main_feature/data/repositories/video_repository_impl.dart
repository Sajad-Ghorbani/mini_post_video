import 'package:dio/dio.dart';
import 'package:mini_post_video/app/core/resources/data_state.dart';
import 'package:mini_post_video/app/main_feature/data/data_source/api_provider.dart';
import 'package:mini_post_video/app/main_feature/data/model/meta_data_model.dart';
import 'package:mini_post_video/app/main_feature/data/model/video_model.dart';
import 'package:mini_post_video/app/main_feature/domain/entities/meta_data_entity.dart';
import 'package:mini_post_video/app/main_feature/domain/entities/video_entity.dart';
import 'package:mini_post_video/app/main_feature/domain/repositories/video_repository.dart';

base class VideoRepositoryImpl implements VideoRepository {
  final ApiProvider _apiProvider;

  VideoRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<({MetaDataEntity metaData, List<VideoEntity> videos})>>
      getAllVideo(int? page) async {
    try {
      Response response = await _apiProvider.getAllVideo(page ?? 0);
      if (response.statusCode == 200) {
        List<Video> videos =
            List.from(response.data['data'].map((x) => Video.fromJson(x)));
        List<VideoEntity> entities = List.from(videos.map((e) => e.toEntity()));
        Metadata metadata = Metadata.fromJson(response.data['metadata']);
        return DataSuccess((videos: entities, metaData: metadata.toEntity()));
      } //
      return const DataFailed(
          'Sorry, the page you are looking for could not be found.');
    } on DioException catch (e) {
      return DataFailed(e.response!.data.toString());
    }
  }

  @override
  Future<DataState<VideoEntity>> getVideo(int id) async {
    try {
      Response response = await _apiProvider.getVideo(id);
      if (response.statusCode == 200) {
        Video video = Video.fromJson(response.data);
        return DataSuccess(video.toEntity());
      } //
      return const DataFailed('The requested resource does not exist.');
    } on DioException catch (e) {
      return DataFailed(e.response!.data['message'].toString());
    }
  }
}
