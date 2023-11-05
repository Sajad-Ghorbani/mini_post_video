import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();
  String baseUrl = 'https://moviesapi.ir/api/v1';

  Future getAllVideo([int page = 0]) async {
    Response response = await dio.get(
      '$baseUrl/movies?page={$page}',
      options: Options(
        responseType: ResponseType.json,
      ),
    );
    return response;
  }

  Future getVideo(int id) async {
    Response response = await dio.get(
      '$baseUrl/movies/$id',
      options: Options(
        responseType: ResponseType.json,
      ),
    );
    return response;
  }
}
