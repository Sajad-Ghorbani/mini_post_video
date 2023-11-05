import 'package:mini_post_video/app/main_feature/domain/entities/video_entity.dart';

class Video {
  int? id;
  String? title;
  String? poster;
  String? year;
  String? director;
  String? writer;
  String? actors;
  String? country;
  String? imdbRating;
  List<String>? genres;

  Video({
    this.id,
    this.title,
    this.poster,
    this.year,
    this.director,
    this.writer,
    this.actors,
    this.country,
    this.imdbRating,
    this.genres,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        title: json["title"],
        poster: json["poster"],
        year: json["year"],
        director: json["director"],
        writer: json["writer"],
        actors: json["actors"],
        country: json["country"],
        imdbRating: json["imdb_rating"],
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
      );

  VideoEntity toEntity() => VideoEntity(
        id: id,
        title: title,
        poster: poster,
        year: year,
        director: director,
        writer: writer,
        actors: actors,
        country: country,
        imdbRating: imdbRating,
        genres: genres == null ? [] : List<String>.from(genres!.map((x) => x)),
      );
}
