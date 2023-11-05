class VideoEntity{
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

  VideoEntity({
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
}